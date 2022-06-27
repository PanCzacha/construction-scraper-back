import puppeteer from 'puppeteer';
import {MaterialRecordEntity, GetMaterialRecordDataRequest, GetMaterialRecordUpdateRequest} from "../types";

export class Search {

    static obiQuery (): GetMaterialRecordDataRequest {
        let data = {} as GetMaterialRecordDataRequest;
        const productArea = document.querySelectorAll("section.overview__description");
        for (const product of productArea) {
            data = {
                name: product.querySelector("h1.h2.overview__heading").textContent,
                currentPrice: product.querySelector("span.overview__price > strong > strong").textContent.replace(/,/,"."),
                link: window.location.href,
            }

        }
        return data;
    }

    static castoramaQuery (): GetMaterialRecordDataRequest {
        let data = {} as GetMaterialRecordDataRequest;
        const productArea = document.querySelectorAll("section.product-card");
        for (const product of productArea) {
            data = {
                name: product.querySelector("h1.heading-base").textContent.trim(),
                currentPrice: product.querySelector(".price-value.price-value--product-page-price-box").textContent.trim().replace(/,/, "."),
                link: window.location.href,
            }
        }
        return data
    }

    static leroyMerlinQuery (): GetMaterialRecordDataRequest {
        let data = {} as GetMaterialRecordDataRequest;
        const productArea  = document.querySelectorAll("section.main-content");
        for (const product of productArea) {
            data = {
                name: product.querySelector("div.product-title > h1").textContent,
                currentPrice: (product.querySelector("span.size-big:nth-child(2)") as HTMLElement).dataset.price,
                link: window.location.href,
            }
        }
        return data
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

    static async searchProduct(productGroup: string, link: string): Promise<MaterialRecordEntity> {
        try {
            const url = new URL(link).hostname;
            const shopName = url.split(".")[1];
            const browser = await puppeteer.launch();
            const page = await browser.newPage();
            await page.setUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36')
            await page.goto(link);
            const product = await page.evaluate(this.chooseQuery(shopName));
            await browser.close();
            return {
                ...product,
                shopName,
                productGroup,
            }
        } catch (err) {
            console.error(err);
        }
    }

    static async updateProduct(link: string, shopName: string): Promise<GetMaterialRecordUpdateRequest> {
        try {
            const browser = await puppeteer.launch();
            const page = await browser.newPage();
            await page.setUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36')
            await page.goto(link);
            const product = await page.evaluate(this.chooseQuery(shopName));
            await browser.close();
            return {
                currentPrice: product.currentPrice,
                link: product.link,
            }
        }
         catch (err) {
            console.error(err);
        }

    }

}
