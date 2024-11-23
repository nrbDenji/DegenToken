// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    struct Leaguecurrency {
        uint256 id;
        string name;
        uint256 price;
    }

    Leaguecurrency[] public inGameItems; // List of in-game items

    // Mapping to track redeemed items for each user
    mapping(address => uint256[]) public redeemedItems;

    // Constructor
    constructor() ERC20("Degen", "DGN") {
        // Initialize some in-game items
        inGameItems.push(Leaguecurrency(1, "$5 Blue essence", 5));
        inGameItems.push(Leaguecurrency(2, "$8 Orange essence", 8));
        inGameItems.push(Leaguecurrency(3, "$10 Loot box", 10));
    }

    // Mint function
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Burn tokens function
    function burnTokens(uint256 amount) public {
        require(amount > 0, "Burn amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        _burn(msg.sender, amount);
    }

    // Redeem tokens for items
    function redeemTokens(uint256 itemId) public {
        require(itemId < inGameItems.length, "Invalid item ID");

        Leaguecurrency storage item = inGameItems[itemId];
        require(balanceOf(msg.sender) >= item.price, "Insufficient balance");

        _burn(msg.sender, item.price);

        // Store redeemed item for the user
        storeRedeemedItem(msg.sender, itemId);
    }

    // Storage function to save redeemed items
    function storeRedeemedItem(address user, uint256 itemId) internal {
        redeemedItems[user].push(itemId);
    }

    // Check redeemed items for a user
    function getRedeemedItems(address account) public view returns (uint256[] memory) {
        return redeemedItems[account];
    }

    // Check token balance of an address
    function checkTokenBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }
}
