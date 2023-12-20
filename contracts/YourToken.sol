// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title YourToken
/// @notice An ERC20 token
contract YourToken is ERC20 {

  uint256 public constant INITIAL_SUPPLY = 1000 * 10 ** 18;

  /// @notice Construct a new ERC20 token, initializes {name} and {symbol}, and mints 1000 tokens to the deployer
  constructor() ERC20("Gold", "GLD") {
    _mint(msg.sender, INITIAL_SUPPLY);
  }
}
