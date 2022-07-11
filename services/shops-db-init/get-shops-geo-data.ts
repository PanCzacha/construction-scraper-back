import {NewShopDataRecord, Shops} from "../../types";
import fetch from "node-fetch";
import {config} from "../../config/config";

export const getShopsGeoData = async (shopDataArray: Shops[], extendedShopDataArray: NewShopDataRecord[]): Promise<void> => {
    await Promise.allSettled(
        shopDataArray.map(async (el) => {
            const address = encodeURIComponent(el.address);
            const res = await fetch(`https://api.openrouteservice.org/geocode/search?api_key=${config.openRouteServiceApiKey}&text=${address}`);
            const data: any = await res.json();
            if(!data) {
                return
            }
            if(!data.features[0]) {
                return
            }

            const lat = data.features[0].geometry.coordinates[1];
            const lon = data.features[0].geometry.coordinates[0];

            extendedShopDataArray.push({
                ...el,
                lat,
                lon,
            })
        })
    )
}
