import {CoordinatesArr, DestinationsArr} from "../types";
import fetch from "node-fetch";

export const getDistances = async (coordinatesArr: CoordinatesArr, destinationsArr: DestinationsArr) => {
    return await fetch("https://api.openrouteservice.org/v2/matrix/driving-car", {
        method: "POST",
        headers: {
            'Authorization': "5b3ce3597851110001cf6248c9fc0fcf417c4819bac2f173b5b1d007",
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
