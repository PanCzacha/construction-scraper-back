export interface ShopListEntity {
    id: string;
    name: string;
    address: string;
    lat: string;
    lon: string;
}

export type NewShopListRecord = Omit<ShopListEntity, "id">;
