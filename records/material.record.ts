import {pool, uuid} from "../utils/db";
import {MaterialRecordEntity} from "../types";
import {FieldPacket} from "mysql2";
import {ValidationError} from "../utils/error";

type ProductRepoResults = [MaterialRecord[], FieldPacket[]];

export class MaterialRecord implements MaterialRecordEntity {
    id: string;
    name: string;
    shopName: string;
    previousPrice: string;
    currentPrice: string;
    link: string;
    productGroup: string;

    constructor(obj: MaterialRecordEntity) {
        if(!obj as any instanceof MaterialRecord) {
            throw new ValidationError("Provided data is not a valid record object.");
        }
        if(!obj.productGroup || obj.productGroup === "" || obj.productGroup.length <= 2 || obj.productGroup.length >= 50) {
            throw new ValidationError(
                "You must provide a valid category name of added product. No more, then 20 and not less then 2 signs in length."
            );
        }
        if(obj.previousPrice === undefined) {
            obj.previousPrice = null;
        }

        Object.assign(this, obj);
    }

    async insertNew(): Promise<void> {
        if(!this.id) {
            this.id = uuid();
        }
        await pool.execute(
            'INSERT INTO `products` VALUES(:id, :name, :shopName, :previousPrice, :currentPrice, :link, :productGroup)',
            {
                id: this.id,
                name: this.name,
                shopName: this.shopName,
                previousPrice: this.previousPrice,
                currentPrice: this.currentPrice,
                link: this.link,
                productGroup: this.productGroup,
            }
        );
    }

    async update(id: string, currPrice: string): Promise<void> {
        await pool.execute('UPDATE `products` SET `previousPrice` = `currentPrice` WHERE `id`= :id', {id});
        await pool.execute('UPDATE `products` SET `currentPrice` = :currPrice WHERE `id` = :id', {id, currPrice});
    }

    static async getAll(): Promise<MaterialRecord[]> {
        const [results] = await pool.execute('SELECT * FROM `products`') as ProductRepoResults;
        return results.map(result => new MaterialRecord(result));
    }

    static async getOne(id: string): Promise<MaterialRecord> {
        const [results] = await pool.execute('SELECT * FROM `products` WHERE `id` = :id', {id,}) as ProductRepoResults;
        return new MaterialRecord(results[0]);
    }

    static async delete(id: string): Promise<string> {
        await pool.execute('DELETE FROM `products` WHERE `id` = :id', {id,});
        return id;
    }


}

