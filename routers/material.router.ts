import express from "express";
import {Search} from "../utils/search";
import {MaterialRecord} from "../records/material.record";

export const materialRouter = express.Router();

materialRouter
    .get("/", async (req, res, next) => {
        const products = await MaterialRecord.getAll();
        res.json(products);
    })

    .post("/add", async (req, res, next) => {
        const {productGroup, link} = req.body;
        const product = await Search.searchProduct(productGroup, link);
        const newProduct = new MaterialRecord(product);
        await newProduct.insertNew();
        res.json(newProduct.id);
    })

    .delete("/delete/:id", async (req, res, next) => {
        const id = req.params.id;
        await MaterialRecord.delete(id);
        res.json(id);
    })

    .patch("/update/:id/", async (req, res, next) => {
        const id = req.params.id;
        const productToUpdate = await MaterialRecord.getOne(id);
        const updateData = await Search.updateProduct(productToUpdate.link, productToUpdate.shopName);
        await productToUpdate.update(productToUpdate.id, updateData.currentPrice);
        res.json(productToUpdate.id);
    })

