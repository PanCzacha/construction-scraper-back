import {pool, uuid} from "../utils/db";
import {FieldPacket} from "mysql2";
import {ValidationError} from "../utils/error";
import {NewShopDataRecord, ShopDataEntity} from "../types";

type ShopRepoResults = [ShopDataEntity[], FieldPacket[]];

export class ShopDataRecord implements ShopDataEntity {
    id: string;
    name: string;
    address: string;
    lat: string;
    lon: string;

    constructor(obj: NewShopDataRecord) {
        if(!obj as any instanceof ShopDataRecord) {
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
                name: this.name,
                address: this.address,
                lat: this.lat,
                lon: this.lon,
            }
        );
    }

    static async getNamedShop(shopName: string): Promise<ShopDataRecord[]> {
        const [results] = await pool.execute('SELECT * FROM `shops` WHERE `name` = :shopName', {shopName,}) as ShopRepoResults;
        return results.map(result => new ShopDataRecord(result));
    }

}
