import {NewShopListRecord, Shops} from "../types";
import fetch from "node-fetch";

const onError = (el: Shops, array: NewShopListRecord[]) => {
    array.push({
        ...el,
        lat: "not found",
        lon: "not found",
    })
}
export const getShopsGeoData = async (shopDataArray: Shops[], extendedShopDataArray: NewShopListRecord[]): Promise<void> => {
    await Promise.allSettled(
        shopDataArray.map(async (el) => {
            const address = encodeURIComponent(el.address);
            const res = await fetch(`https://api.openrouteservice.org/geocode/search?api_key=5b3ce3597851110001cf6248c9fc0fcf417c4819bac2f173b5b1d007&text=${address}`);
            const data: any = await res.json();
            if(data === undefined) {
                onError(el, extendedShopDataArray);
                return
            }
            const lat = data.features[0] === undefined ? "not found" : data.features[0].geometry.coordinates[1];
            const lon = data.features[0] === undefined ? "not found" : data.features[0].geometry.coordinates[0];
            extendedShopDataArray.push({
                ...el,
                lat,
                lon,
            })
        })
    )
}
