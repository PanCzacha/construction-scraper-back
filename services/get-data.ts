import puppeteer from 'puppeteer';
import {GetMaterialRecordDataRequest, PatchMaterialRecordUpdateRequest, NewMaterialRecordEntity} from "../types";

export class GetData {

    static obiQuery(): GetMaterialRecordDataRequest {
        let data = {} as GetMaterialRecordDataRequest;
        const productArea = document.querySelectorAll("section.overview__description");

        for (const product of productArea) {
            data = {
                name: product.querySelector("h1.h2.overview__heading").textContent,
                currentPrice: product.querySelector(".overview__price > strong:nth-child(1) > strong:nth-child(1)").textContent.replace(/,/,"."),
                unit: "szt.",
                link: window.location.href,
            }

        }
        return data;
    }

    static castoramaQuery(): GetMaterialRecordDataRequest {
        let data = {} as GetMaterialRecordDataRequest;
        const productArea = document.querySelectorAll("section.product-card");
        for (const product of productArea) {
            data = {
                name: product.querySelector("h1.heading-base").textContent.trim(),
                currentPrice: product.querySelector(".price-value.price-value--product-page-price-box").textContent.trim().replace(/,/, "."),
                unit: (product.querySelector(".price-unit--product-page-price-box") as HTMLElement).outerText.slice(-3) === "m 2" ? "m2" : "szt.",
                link: window.location.href,
            }
        }
        return data;
    }

    static leroyMerlinQuery(): GetMaterialRecordDataRequest {
        let data = {} as GetMaterialRecordDataRequest;
        const productArea = document.querySelectorAll("section.main-content");
        for (const product of productArea) {
            data = {
                name: product.querySelector("div.product-title > h1").textContent,
                currentPrice: (product.querySelector("span.size-big:nth-child(2)") as HTMLElement).dataset.price,
                unit: (() => {
                    const item = (product.querySelector("span.size-big:nth-child(2)>span:nth-child(3)>span:nth-child(3)>span:nth-child(1)") as HTMLElement).textContent.slice(-4)
                    if (item === " /m2") {
                        return "m2"
                    } else {
                        return item
                    }
                })()
                ,
                link: window.location.href,
            }
        }
        return data;
    }

    static chooseQuery(shopName: string) {
        switch (shopName) {
            case "castorama":
                return this.castoramaQuery
            case "obi":
                return this.obiQuery
            case "leroymerlin":
                return this.leroyMerlinQuery
        }
    }

    static async getNewRecord(link: string, productGroup: string): Promise<NewMaterialRecordEntity> {
        try {
            const url = new URL(link).hostname;
            const shopName = url.split(".")[1];
            const browser = await puppeteer.launch();
            const page = await browser.newPage();
            await page.setExtraHTTPHeaders({'dnt': '1'})
            await page.setUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36')
            await page.goto(link);
            const product = await page.evaluate(this.chooseQuery(shopName));
            await browser.close();
            return {
                ...product,
                shopName,
                productGroup,
            };
        } catch (err) {
            console.error(err);
        }
    }

    static async updateRecordPrice(link: string, shopName: string): Promise<PatchMaterialRecordUpdateRequest> {
        try {
            const browser = await puppeteer.launch();
            const page = await browser.newPage();
            await page.setExtraHTTPHeaders({'dnt': '1'})
            await page.setUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36')
            await page.goto(link);
            const product = await page.evaluate(this.chooseQuery(shopName));
            await browser.close();
            return product.currentPrice;
        } catch (err) {
            console.error(err);
        }
    }

}
