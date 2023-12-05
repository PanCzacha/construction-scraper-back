import {pool, uuid} from "../utils/db";
import {MaterialRecordEntity, NewMaterialRecordEntity} from "../types";
import {FieldPacket} from "mysql2";
import {ValidationError} from "../utils/error";


type ProductRepoResults = [MaterialRecord[], FieldPacket[]];

export class MaterialRecord implements MaterialRecordEntity {
    id: string;
    name: string;
    shopName: string;
    previousPriceDate: string | null;
    previousPrice: number;
    currentPrice: number;
    updateDate: string;
    unit: string;
    link: string;
    productGroup: string;

    constructor(obj: NewMaterialRecordEntity) {
        if (!obj.productGroup || obj.productGroup === "" || obj.productGroup.length <= 2 || obj.productGroup.length >= 50) {
            throw new ValidationError(
                "Provided category name not valid. Must have at least 2 signs and no more than 50."
            );
        }
        if (!obj as any instanceof MaterialRecord) {
            throw new ValidationError("Provided data is not a valid record object.");
        }

        Object.assign(this, obj);
    }

    async insertNew(): Promise<void> {
        if (!this.id) {
            this.id = uuid();
        }
        if (this.unit === undefined || this.unit === "" || this.unit === null) {
            this.unit = ".szt"
        }
        if (this.previousPrice === undefined) {
            this.previousPrice = null;
        }
        if (this.previousPriceDate === undefined) {
            this.previousPriceDate = null;
        }
        if (this.updateDate === undefined) {
            this.updateDate = new Date().toLocaleDateString("pl-PL")
        }
        await pool.execute('INSERT INTO `products` VALUES(:id, :name, :shopName, :previousPriceDate, :previousPrice, :currentPrice,' +
            ' :updateDate, :unit,' +
            ' :link, :productGroup)',
            {
                id: this.id,
                name: this.name,
                shopName: this.shopName,
                previousPriceDate: this.previousPriceDate,
                previousPrice: this.previousPrice,
                currentPrice: this.currentPrice,
                updateDate: this.updateDate,
                unit: this.unit,
                link: this.link,
                productGroup: this.productGroup,
            }
        );
    }

    async update(id: string, currPrice: string): Promise<void> {
        const newUpdateDate = new Date().toLocaleDateString("pl-PL");
        await pool.execute('UPDATE `products` SET `previousPrice` = `currentPrice` WHERE `id`= :id', {id});
        await pool.execute('UPDATE `products` SET `currentPrice` = :currPrice WHERE `id` = :id', {id, currPrice});
        await pool.execute('UPDATE `products` SET `previousPriceDate` = `updateDate` WHERE `id` = :id', {id});
        await pool.execute('UPDATE `products` SET `updateDate` = :newUpdateDate WHERE `id` = :id', {id, newUpdateDate});
    }

    static async getAll(): Promise<MaterialRecord[]> {
        const [results] = await pool.execute('SELECT * FROM `products`') as ProductRepoResults;
        return results.map(result => new MaterialRecord(result));
    }

    static async getOne(id: string): Promise<MaterialRecord> {
        const [results] = await pool.execute('SELECT * FROM `products` WHERE `id` = :id', {id,}) as ProductRepoResults;
        return new MaterialRecord(results[0]);
    }

    static async delete(id: string): Promise<void> {
        await pool.execute('DELETE FROM `products` WHERE `id` = :id', {id,});
    }

}

