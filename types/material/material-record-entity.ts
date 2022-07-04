export interface MaterialRecordEntity {
    id: string;
    name: string;
    shopName: string;
    previousPrice?: string;
    currentPrice: string;
    unit?: string;
    link: string;
    productGroup: string;
}

export type NewMaterialRecordEntity = Omit<MaterialRecordEntity, "id">;
