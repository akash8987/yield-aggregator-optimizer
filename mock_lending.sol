// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MockLending {
    uint256 public rate;
    function setRate(uint256 _rate) external { rate = _rate; }
    function getSupplyRate(address) external view returns (uint256) { return rate; }
    function deposit(address, uint256) external {}
    function withdraw(address, uint256) external {}
}
