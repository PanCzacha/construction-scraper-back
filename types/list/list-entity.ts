export interface ListRecordEntity {
    id: string;
    shopId: string;
    shopAddress: string;
    shopName: string;
    productName: string;
    materialQuantity: number;
    materialCost: number;
    unit: string;
}

export type NewListRecordEntity = Omit<ListRecordEntity, "id">
