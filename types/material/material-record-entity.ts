export interface MaterialRecordEntity {
    id?: string;
    name: string;
    shopName: string;
    previousPrice?: string;
    currentPrice: string;
    link: string;
    productGroup: string;
}

export type GetMaterialRecordDataRequest = Omit<MaterialRecordEntity, "id" | "shopName" | "productGroup" | "previousPrice">;

export type GetMaterialRecordUpdateRequest = Omit<MaterialRecordEntity, "id" | "name" | "previousPrice" | "productGroup" | "shopName">;
