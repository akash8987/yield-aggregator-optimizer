async function main() {
    const Vault = await ethers.getContractFactory("YieldVault");
    const vault = await Vault.deploy("0xUSDC_ADDR", "0xAAVE_ADDR");
    console.log("Optimizer Vault deployed to:", vault.target);
}
