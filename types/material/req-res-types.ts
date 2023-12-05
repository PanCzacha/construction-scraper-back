import {MaterialRecordEntity} from "./material-record-entity";
import {ValidationError} from "../../utils/error";

export type GetMaterialRecordDataRequest = Omit<MaterialRecordEntity, "id" | "shopName" | "productGroup" | "previousPriceDate" | "previousPrice">;

export type PatchMaterialRecordUpdateRequest = string | number;

