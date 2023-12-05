import puppeteer from "puppeteer";
import {
  GetMaterialRecordDataRequest,
  PatchMaterialRecordUpdateRequest,
  NewMaterialRecordEntity,
} from "../types";
import { ValidationError } from "../utils/error";
import { checkURL } from "../utils/checkURL";

export class GetData {
  static obiQuery(): GetMaterialRecordDataRequest {
    let data = {} as GetMaterialRecordDataRequest;
    const date = new Date().toLocaleDateString("pl-PL");
    const productArea = document.querySelectorAll(".overview__description");
    for (const product of productArea) {
      data = {
        name: product.querySelector("h1.h2.overview__heading").textContent,
        currentPrice: Number(
          product
            .querySelector(
              ".overview__price > strong:nth-child(1) > strong:nth-child(1)"
            )
            .textContent.replace(" ", "")
            .replace(/,/, ".")
            .trim()
        ),
        unit: "szt.",
        link: window.location.href,
        updateDate: date,
      };
    }
    return data;
  }

  static castoramaQuery(): GetMaterialRecordDataRequest {
    let data = {} as GetMaterialRecordDataRequest;
    const date = new Date().toLocaleDateString("pl-PL");
    const productArea = document.querySelectorAll(
      "div[data-test-id='hero-info-grid']"
    );
    for (const product of productArea) {
      data = {
        name: product.querySelector("h1#product-title").textContent.trim(),
        currentPrice: Number(
          product
            .querySelector("._5d34bd7a:nth-child(1)")
            .textContent.trim()
            .replace(/,/, ".")
        ),
        unit:
          (
            product.querySelector("._5d34bd7a:nth-child(3)") as HTMLElement
          ).outerText.slice(-3) === "m 2"
            ? "m2"
            : "szt.",
        link: window.location.href,
        updateDate: date,
      };
    }
    return data;
  }

  // LEROY NIE DZIAŁA
  static leroyMerlinQuery(): GetMaterialRecordDataRequest {
    let data = {} as GetMaterialRecordDataRequest;
    const date = new Date().toLocaleDateString("pl-PL");
    const productArea = document.querySelectorAll(
      "#component-productdetailmaincdp"
    );
    for (const product of productArea) {
      data = {
        name: document
          .querySelector("#product-name")
          .textContent.trim()
          .slice(0, -46),
        currentPrice: Number(
          document
            .querySelector(".js-main-price")
            .textContent.trim()
            .slice(0, -3)
        ),
        unit: (() => {
          const item = product.querySelector(
            "#product-price > div:nth-child(1) > p:nth-child(1) > span:nth-child(3)"
          ).textContent;

          if (item === " /m2") {
            return "m2";
          }
          if (item === " /szt.") {
            return "szt.";
          } else {
            return item;
          }
        })(),
        link: window.location.href,
        updateDate: date,
      };
    }
    console.log(data);
    return data;
  }
  // LEROY NIE DZIAŁA
  static chooseQuery(shopName: string) {
    switch (shopName) {
      case "castorama":
        return this.castoramaQuery;
      case "obi":
        return this.obiQuery;
      case "leroymerlin":
        return this.leroyMerlinQuery;
    }
  }

  static async getNewRecord(
    link: string,
    productGroup: string
  ): Promise<NewMaterialRecordEntity> {
    if (!checkURL(link)) {
      throw new ValidationError("Provided input is not a valid URL");
    }
    try {
      const url = new URL(link).hostname;
      const shopName = url.split(".")[1];
      const browser = await puppeteer.launch({
        headless: false,
      });
      const page = await browser.newPage();
      await page.setExtraHTTPHeaders({ dnt: "1" });
      await page.setUserAgent(
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
      );
      await page.goto(link);
      const product = await page.evaluate(this.chooseQuery(shopName));
      await browser.close();
      return {
        ...product,
        shopName,
        productGroup,
      };
    } catch (err) {
      throw new Error(err.message);
    }
  }

  static async updateRecordPrice(
    link: string,
    shopName: string
  ): Promise<PatchMaterialRecordUpdateRequest> {
    if (!checkURL(link)) {
      throw new ValidationError(
        "URL used to update is invalid. Please check if the item still exists."
      );
    }
    try {
      const browser = await puppeteer.launch();
      const page = await browser.newPage();
      await page.setExtraHTTPHeaders({ dnt: "1" });
      await page.setUserAgent(
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
      );
      await page.goto(link);
      const product = await page.evaluate(this.chooseQuery(shopName));
      await browser.close();
      return product.currentPrice;
    } catch (err) {
      throw new Error(err.message);
    }
  }
}
