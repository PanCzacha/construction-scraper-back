import {NewShopDataRecord, Shops} from "../../types";
import {getShopsGeoData} from "./get-shops-geo-data";
import {ShopDataRecord} from "../../records/shop-data.record";
import {GetShops} from "./get-shops";
import {wait} from "../../utils/wait";

const initShops = async (): Promise<void> => {
    let shopsAddressData: Shops[] = [];
    const shopsToGet = ["https://www.promoceny.pl/sklepy/szukaj/castorama/", "https://www.promoceny.pl/sklepy/szukaj/obi/", "https://www.promoceny.pl/sklepy/szukaj/leroy-merlin/"];
    await Promise.allSettled(
        shopsToGet.map(async (shop) => {
            const res = await GetShops.getShopList(shop);
            shopsAddressData.push(...res);
        })
    )

    let shopsGeoLocationData: NewShopDataRecord[] = [];

    const shopsAddressDataPart1 = shopsAddressData.slice(0, 99);
    const shopsAddressDataPart2 = shopsAddressData.slice(99, 199);
    const shopsAddressDataPart3 = shopsAddressData.slice(199);

    console.log("Executing first part.");
    await getShopsGeoData(shopsAddressDataPart1, shopsGeoLocationData);
    console.log("Waiting time no.1")
    await wait(1000 * 70);

    console.log("Executing second part.");
    await getShopsGeoData(shopsAddressDataPart2, shopsGeoLocationData);
    console.log("Waiting time no.2")
    await wait(1000 * 70);

    console.log("Executing third part.");
    await getShopsGeoData(shopsAddressDataPart3, shopsGeoLocationData);

    console.log("Inserting into database...");

    for (const geoLocation of shopsGeoLocationData) {
        await new ShopDataRecord(geoLocation).insert();
    }

    console.log("Done");

    return
}

initShops().catch(err => console.error(err));
