const { ethers } = require("ethers");

async function checkAndRebalance(vaultAddress, protocolA, protocolB) {
    const rateA = await protocolA.getSupplyRate();
    const rateB = await protocolB.getSupplyRate();

    if (rateB > rateA) {
        console.log("Moving funds to Protocol B for higher yield...");
        await vault.rebalance(protocolB.address);
    }
}
