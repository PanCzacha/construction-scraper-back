import express from "express";
import {ShoplistRecord} from "../records/shoplist.record";
import {DistanceMatrixReq} from "../types";
import {getDistances} from "../utils/get-distances";
export const shopDataRouter = express.Router();

shopDataRouter
    .get("/distances/:shopName/:coordinates", async (req, res, next) => {
        const {shopName, coordinates} = req.params;
        // const firstLetterUpperCase = (s: string) => {
        //     if(s === "leroymerlin") {
        //         return "Leroy Merlin"
        //     }
        //     return s.split(" ")
        //         .map((substring: string) => substring[0].toUpperCase() + substring.slice(1))
        //         .join(" ")
        // }
        const lon = coordinates.split(",")[0].trim();
        const lat = coordinates.split(",")[1].trim();
        // const properShopName = firstLetterUpperCase(shopName);
        const dbData = await ShoplistRecord.getNamedShop(shopName);

        const coordinatesForReq = dbData.map((shop) => {
            return [
                shop.lon,
                shop.lat
            ]
        })
        coordinatesForReq.unshift([lon, lat]);

        let destinationsForReq: number[] = [];
        for(let i = 1; i < coordinatesForReq.length; i++) {
            destinationsForReq.push(i);
        }

        const response = await getDistances(coordinatesForReq, destinationsForReq);
        const apiData = await response.json();

        const [distances] = apiData.distances;

        const shopsWithDistances: DistanceMatrixReq[] = dbData.map((shop,i) => {
            return {
                address: shop.address,
                distance: distances[i],
            }
        })

        res.json(shopsWithDistances);
    })
