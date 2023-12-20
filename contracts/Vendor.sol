// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

/// @title Vendor
/// @notice A contract that sells tokens for ETH and vice versa
contract Vendor is Ownable {

  uint256 public constant TOKENS_PER_ETH = 100;
  YourToken public immutable yourToken;

  event BuyTokens(address indexed buyer, uint256 indexed amountOfETH, uint256 indexed amountOfTokens);
  event SellTokens(address indexed seller, uint256 indexed amountOfTokens, uint256 indexed amountOfEth);

  error OnlyOwner(address caller, address owner);
  error FailedToSendEther();
  error NothingToWithdraw();
  error FailedToSendTokens();

  /// @notice Construct a new Vendor contract
  /// @param tokenAddress The address of the token to sell
  constructor(address tokenAddress) {
    yourToken = YourToken(tokenAddress);
  }

  /// @notice Buy tokens with ETH
  function buyTokens() external payable {
    uint256 amount = msg.value * TOKENS_PER_ETH;
    emit BuyTokens(msg.sender, msg.value, amount);
    yourToken.transfer(msg.sender, amount);
  }

  /// @notice Withdraw ETH from the contract and
  ///         only the owner can call this function
  function withdraw() external {
    if (msg.sender != owner()) {
      revert OnlyOwner(msg.sender, owner());
    }
    if (address(this).balance == 0) {
      revert NothingToWithdraw();
    }
    (bool success,) = msg.sender.call{value: address(this).balance}("");
    if (!success) {
      revert FailedToSendEther();
    }
  }

  /// @notice Sell tokens for ETH
  /// @param _amount The amount of tokens to sell
  function sellTokens(uint256 _amount) external {
    uint256 amountOfEth = _amount / TOKENS_PER_ETH;
    emit SellTokens(msg.sender, _amount, amountOfEth);
    (bool sent) = yourToken.transferFrom(msg.sender, address(this), _amount);
    if (!sent) {
      revert FailedToSendTokens();
    }
    (bool success,) = msg.sender.call{value: amountOfEth}("");
    if (!success) {
      revert FailedToSendEther();
    }
  }
}
