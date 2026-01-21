// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ILendingProtocol {
    function deposit(address asset, uint256 amount) external;
    function withdraw(address asset, uint256 amount) external;
    function getSupplyRate(address asset) external view returns (uint256);
}
