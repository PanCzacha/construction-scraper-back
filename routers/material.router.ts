import express from "express";
import { GetData } from "../services/get-data";
import { MaterialRecord } from "../records/material.record";
import { ValidationError } from "../utils/error";
import { log } from "console";

export const materialRouter = express.Router();

materialRouter
  .get("/", async (req, res, next) => {
    try {
      const products = await MaterialRecord.getAll();
      res.json(products);
    } catch (err) {
      next(err);
    }
  })

  .post("/add", async (req, res, next) => {
    try {
      const { productGroup, link } = req.body;
      const product = await GetData.getNewRecord(link, productGroup);
      const newProduct = new MaterialRecord(product);
      await newProduct.insertNew();
      res.json(newProduct.id);
      console.log("DUPA");
    } catch (err) {
      next(err);
    }
  })

  .delete("/delete/:id", async (req, res, next) => {
    try {
      const id = req.params.id;
      await MaterialRecord.delete(id);
      res.json(id);
    } catch (err) {
      next(err);
    }
  })

  .patch("/update/:id/", async (req, res, next) => {
    try {
      const id = req.params.id;
      const productToUpdate = await MaterialRecord.getOne(id);
      const newPrice = await GetData.updateRecordPrice(
        productToUpdate.link,
        productToUpdate.shopName
      );
      await productToUpdate.update(productToUpdate.id, newPrice as string);
      res.json(productToUpdate.id);
    } catch (err) {
      next(err);
    }
  });
