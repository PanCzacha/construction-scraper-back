import {pool, uuid} from "../utils/db";
import {FieldPacket} from "mysql2";
import {ValidationError} from "../utils/error";
import {ListRecordEntity, NewListRecordEntity} from "../types/list";

type ListRepoResults = [ListRecord[], FieldPacket[]];

export class ListRecord implements ListRecordEntity {
    id: string;
    shopId: string;
    shopName: string;
    shopAddress: string;
    productName: string;
    materialCost: number;
    materialQuantity: number;
    unit: string;

    constructor(obj: NewListRecordEntity) {
        if(!obj as any instanceof ListRecord) {
            throw new ValidationError("Provided data is not a valid record object.");
        }

        Object.assign(this, obj);
    }

    async insert(): Promise<void> {
        if(!this.id) {
            this.id = uuid();
        }
        await pool.execute(
            'INSERT INTO `list` VALUES(:id, :shopId, :shopAddress, :shopName, :productName, :materialQuantity, :materialCost, :unit)',
            {
                id: this.id,
                shopId: this.shopId,
                shopAddress: this.shopAddress,
                shopName: this.shopName,
                productName: this.productName,
                materialQuantity: this.materialQuantity,
                materialCost: this.materialCost,
                unit: this.unit,
            }
        );
    }

    static async getAll(): Promise<ListRecord[]> {
        const [results] = await pool.execute('SELECT * FROM `list`') as ListRepoResults;
        return results.map(result => new ListRecord(result));
    }

    static async delete(id: string): Promise<void> {
        await pool.execute('DELETE FROM `list` WHERE `id` = :id', {id,});
    }


    static async deleteAll(): Promise<void> {
        await pool.execute('DELETE FROM `list`');
    }

}
