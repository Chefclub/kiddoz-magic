const { giveChange, kiddozCoins } = require("./src/KiddozAlgo.bs");

const res = giveChange(30, kiddozCoins);

console.log(30, "-->", res);
