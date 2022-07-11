import {Shops} from "../../types";
import {makeLowerCase} from "../../utils/make-lowercase";
import puppeteer from "puppeteer";

export class GetShops {
    static async extractDataFromSinglePage(page: any): Promise<Shops[]> {
        return await page.evaluate(() => {
            let data: Shops[] = [];

            const table = Array.from(document.querySelectorAll("tr"));
            table.forEach((item) => {
                data.push({
                    name: item.children[0].textContent.trim(),
                    address: makeLowerCase(item.children[1].textContent.trim()),
                })
            })

            data.shift();

            return data;
        })
    }

    static async getShopList(link: string): Promise<Shops[]> {
        let results: Shops[] = [];

        const browser = await puppeteer.launch();
        const page = await browser.newPage();
        await page.setUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36')
        await page.goto(link);
        await page.click("button.rodo-popup-agree");
        const pagesNumber = await page.evaluate(() => document.querySelector("ul.pagination").children.length);

        const lastPageNumber = pagesNumber - 2;
        for (let index = 0; index < lastPageNumber; index++) {
            await page.waitForSelector(".table");
            const list = await this.extractDataFromSinglePage(page);
            results.push(...list);
            await page.click(`ul.pagination > li:last-child`);
            await page.waitForSelector(".table");
        }

        await browser.close();

        return results;
    }
}
