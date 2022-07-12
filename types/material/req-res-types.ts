import {MaterialRecordEntity} from "./material-record-entity";

export type GetMaterialRecordDataRequest = Omit<MaterialRecordEntity, "id" | "shopName" | "productGroup" | "previousPrice">;

export type PatchMaterialRecordUpdateRequest = string | number;

