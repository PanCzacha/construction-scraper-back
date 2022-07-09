import {pool, uuid} from "../utils/db";
import {FieldPacket} from "mysql2";
import {ValidationError} from "../utils/error";
import {NewShopListRecord, ShopListEntity} from "../types";
import {makeLowerCaseName} from "../utils/make-lowercase-names";

type ShopRepoResults = [ShopListEntity[], FieldPacket[]];

export class ShoplistRecord implements ShopListEntity {
    id: string;
    name: string;
    address: string;
    lat: string;
    lon: string;

    constructor(obj: NewShopListRecord) {
        if(!obj as any instanceof ShoplistRecord) {
            throw new ValidationError("Provided data is not a valid record object.");
        }
        Object.assign(this, obj);
    }

    async insert(): Promise<void> {
        if(!this.id) {
            this.id = uuid();
        }
        await pool.execute(
            'INSERT INTO `shops` VALUES(:id, :name, :address, :lat, :lon)',
            {
                id: this.id,
                name: makeLowerCaseName(this.name),
                address: this.address,
                lat: this.lat,
                lon: this.lon,
            }
        );
    }

    static async getAll(): Promise<ShoplistRecord[]> {
        const [results] = await pool.execute('SELECT * FROM `shops`') as ShopRepoResults;
        return results.map(result => new ShoplistRecord(result));
    }

    static async getOne(id: string): Promise<ShoplistRecord> {
        const [results] = await pool.execute('SELECT * FROM `shops` WHERE `id` = :id', {id,}) as ShopRepoResults;
        return new ShoplistRecord(results[0]);
    }

    static async getNamedShop(shopName: string): Promise<ShoplistRecord[]> {
        const [results] = await pool.execute('SELECT * FROM `shops` WHERE `name` = :shopName', {shopName,}) as ShopRepoResults;
        return results.map(result => new ShoplistRecord(result));
    }

}
