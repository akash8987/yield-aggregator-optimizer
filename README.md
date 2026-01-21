# Yield Aggregator Optimizer

This repository features a professional "Set-and-Forget" yield strategy. The contract acts as a gateway for liquidity providers, ensuring their assets are always earning the maximum possible interest rate across the DeFi ecosystem.

### Core Logic
* **Dynamic Rebalancing:** The `rebalance()` function compares supply rates across integrated protocols and shifts capital to the leader.
* **Capital Efficiency:** Uses an "Idle-to-Work" flow where unallocated funds are never left sitting in the vault.
* **Fee Socialization:** Gas costs for rebalancing are socialized across all vault participants, making high-frequency optimization viable for smaller players.

### Integration Path
1. **Deposit:** User deposits `USDC` into the Vault.
2. **Allocation:** The Vault deposits `USDC` into Aave to earn `aUSDC`.
3. **Monitor:** Off-chain bots monitor Compound's `cUSDC` rate.
4. **Shift:** If Compound rate > Aave rate, the Vault moves funds automatically.



### Safety
* **Withdrawal Buffer:** Always keeps a small percentage of assets liquid to handle immediate withdrawals without triggering a full rebalance.
* **Slippage Control:** Prevents rebalancing if the cost of movement exceeds the projected yield gain.
