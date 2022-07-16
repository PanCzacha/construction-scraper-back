import express from "express";
import {ListRecord} from "../records/list.record";
export const listRouter = express.Router();

listRouter
    .get("/", async (req, res, next) => {
        try {
            const products = await ListRecord.getAll();
            res.json(products);
        } catch (err) {
            next(err);
        }
    })
    .post("/", async (req, res, next) => {
        try {
            const newListItem = new ListRecord(req.body);
            await newListItem.insert();
            res.json(newListItem.id);
        } catch (err) {
            next(err)
        }
    })
    .delete("/delete", async (req, res, next) => {
        try {
            await ListRecord.deleteAll();
            res.sendStatus(200);
        } catch (err) {
            next(err)
        }
    })
    .delete("/delete/:id", async (req, res, next) => {
        try {
            await ListRecord.delete(req.params.id);
            res.json(req.params.id);
        } catch (err) {
            next(err)
        }
    })

