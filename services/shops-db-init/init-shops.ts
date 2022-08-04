import {NewShopDataRecord, Shops} from "../../types";
import {getShopsGeoData} from "./get-shops-geo-data";
import {ShopDataRecord} from "../../records/shop-data.record";
import {GetShops} from "./get-shops";
import {wait} from "../../utils/wait";

const initShops = async (): Promise<void> => {
    let shopsAddressData: Shops[] = [];
    const shopsToGetGeoLocationFrom = ["https://www.promoceny.pl/sklepy/szukaj/castorama/", "https://www.promoceny.pl/sklepy/szukaj/obi/", "https://www.promoceny.pl/sklepy/szukaj/leroy-merlin/"];
    await Promise.allSettled(
        shopsToGetGeoLocationFrom.map(async (shop) => {
            const res = await GetShops.getShopList(shop);
            shopsAddressData.push(...res);
        })
    )

    let shopsGeoLocationData: NewShopDataRecord[] = [];

    const shopsAddressDataPart1 = shopsAddressData.slice(0, 99);
    const shopsAddressDataPart2 = shopsAddressData.slice(99, 199);
    const shopsAddressDataPart3 = shopsAddressData.slice(199);

    console.log("Getting geolocation of 1 / 3 address arrays.");
    await getShopsGeoData(shopsAddressDataPart1, shopsGeoLocationData);
    console.log("Waiting time after first part")
    await wait(1000 * 70);

    console.log("Getting geolocation of 2 / 3 address arrays.");
    await getShopsGeoData(shopsAddressDataPart2, shopsGeoLocationData);
    console.log("Waiting time after second part")
    await wait(1000 * 70);

    console.log("Getting geolocation of 3 / 3 address arrays.");
    await getShopsGeoData(shopsAddressDataPart3, shopsGeoLocationData);

    console.log("Inserting into database...");

    for (const geoLocation of shopsGeoLocationData) {
        await new ShopDataRecord(geoLocation).insert();
    }

    console.log("Done");

    return
}

initShops().catch(err => console.error(err));
