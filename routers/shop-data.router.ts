import express from "express";
import {ShopDataRecord} from "../records/shop-data.record";
import {DistanceMatrixReq} from "../types";
import {getDistances} from "../services/get-distances";

export const shopDataRouter = express.Router();

shopDataRouter
    .get("/distances/:shopName/:coordinates", async (req, res, next) => {
        try {
            const {shopName, coordinates} = req.params;
            const lon = coordinates.split(",")[0].trim();
            const lat = coordinates.split(",")[1].trim();
            const dbData = await ShopDataRecord.getNamedShop(shopName);

            const coordinatesForReq = dbData.map((shop) => {
                return [
                    shop.lon,
                    shop.lat
                ]
            })
            coordinatesForReq.unshift([lon, lat]);

            let destinationsForReq: number[] = [];
            for (let i = 1; i < coordinatesForReq.length; i++) {
                destinationsForReq.push(i);
            }

            const response = await getDistances(coordinatesForReq, destinationsForReq);
            const apiData = await response.json();

            const [distances] = apiData.distances;

            const shopsWithDistances: DistanceMatrixReq[] = dbData.map((shop, i) => {
                return {
                    address: shop.address,
                    distance: distances[i],
                }
            })

            res.json(shopsWithDistances);

        } catch (err) {
            next(err)
        }
    })
