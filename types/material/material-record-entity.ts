export interface MaterialRecordEntity {
    id: string;
    name: string;
    shopName: string;
    previousPriceDate: string | null;
    previousPrice: number | null;
    currentPrice: number;
    updateDate: string;
    unit: string;
    link: string;
    productGroup: string;
}

export type NewMaterialRecordEntity = Omit<MaterialRecordEntity, "id" | "previousPriceDate" | "previousPrice">;


