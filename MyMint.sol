// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyMint is ERC20 {

    string tokenName = "GEARcoin";
    string tokenSymbol = "GAS";
    uint256 tokenDecimals = 18;
    uint256 maxTokenSupply = 9000000 * (10 ** tokenDecimals);

    constructor() ERC20(tokenName, tokenSymbol) {}

    function mint(uint256 amountToMint) public {
        // Enforce min and max minting limits
        require(amountToMint >= 5, "You must mint at least 5 tokens.");
        require(amountToMint <= 100000, "You cannot mint more than 100,000 tokens at a time.");

        uint256 amountInDecimals = amountToMint * (10 ** tokenDecimals);
        uint256 currentSupply = totalSupply();

        require(currentSupply + amountInDecimals <= maxTokenSupply, 
            "Minting the amount requested would exceed the max supply allowed.");

        _mint(msg.sender, amountInDecimals);
    }
}
