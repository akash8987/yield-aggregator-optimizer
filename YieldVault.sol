// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IProtocol.sol";

contract YieldVault is Ownable {
    IERC20 public asset;
    address public activeProtocol;

    constructor(address _asset, address _initialProtocol) Ownable(msg.sender) {
        asset = IERC20(_asset);
        activeProtocol = _initialProtocol;
    }

    function deposit(uint256 amount) external {
        asset.transferFrom(msg.sender, address(this), amount);
        _invest(amount);
    }

    function rebalance(address newProtocol) external onlyOwner {
        uint256 balance = asset.balanceOf(activeProtocol);
        ILendingProtocol(activeProtocol).withdraw(address(asset), balance);
        
        activeProtocol = newProtocol;
        _invest(asset.balanceOf(address(this)));
    }

    function _invest(uint256 amount) internal {
        asset.approve(activeProtocol, amount);
        ILendingProtocol(activeProtocol).deposit(address(asset), amount);
    }
}
