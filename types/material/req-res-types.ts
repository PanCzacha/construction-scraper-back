import {MaterialRecordEntity} from "./material-record-entity";

export type GetMaterialRecordDataRequest = Omit<MaterialRecordEntity, "id" | "shopName" | "productGroup" | "previousPriceDate" | "previousPrice">;

export type PatchMaterialRecordUpdateRequest = string | number;

