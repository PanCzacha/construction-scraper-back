export const makeLowerCase = (shopName: string) => {
    return shopName.split(" ").join("").trim().toLowerCase();
}
