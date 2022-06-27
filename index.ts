import express, {json} from 'express';
import "express-async-errors";
import {handleError} from "./utils/error";
import cors from "cors";
import "./utils/db";
import {materialRouter} from "./routers/material.router"

const app = express();
const port: number = 3001;

app.use(json());
app.use(cors({
    origin: "http://localhost:3000",
}))

app.use("/", materialRouter);
app.use(handleError);

app.listen(port, "localhost", () => {
    console.log(`Listening on http://localhost:${port}`);
});
