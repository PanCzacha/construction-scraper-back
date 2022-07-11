export interface ShopDataEntity {
    id: string;
    name: string;
    address: string;
    lat: string;
    lon: string;
}

export type NewShopDataRecord = Omit<ShopDataEntity, "id">;
