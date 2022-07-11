import {CoordinatesArr, DestinationsArr} from "../types";
import fetch from "node-fetch";
import {config} from "../config/config";

export const getDistances = async (coordinatesArr: CoordinatesArr, destinationsArr: DestinationsArr) => {
    return await fetch("https://api.openrouteservice.org/v2/matrix/driving-car", {
        method: "POST",
        headers: {
            'Authorization': `${config.openRouteServiceApiKey}`,
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify(
            {
                "locations": [...coordinatesArr],
                "destinations": [...destinationsArr],
                "metrics": ["distance"],
                "resolve_locations": "false",
                "sources": [0],
                "units": "km"
            }
        )
    })
}
