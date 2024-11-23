# League Currency

## Description

DegenToken is a token contract built on the Ethereum blockchain using the ERC20 standard. The contract allows the owner to mint tokens, while users can burn tokens to redeem in-game items such as currency and loot boxes. The contract supports tracking redeemed items for each user and allows users to check their token balance and redeemed items.
## Prerequisites

- Any JS IDE that has Node.js installed
- Metamask wallet that connected to Avalanche Fuji network
- SnowTrace Testnet
- Remix IDE

## Getting Started

### Installing

1. This code can be used by cloning this repository.
   
  ```git clone <repository-url(copy it under drop-down green code button on the repo)>```

2. In your preferred JS IDE open the terminal and type:

- terminal: ```npm i```

### Executing program

1. Back to the terminal, type `npx hardhat run scripts/deploy.js --network fuji
` to get your address for SnowTrace Testnet
2. Open https://testnet.snowtrace.io/ to paste your address in the search bar and click it that will be your history transaction.
3. Now open your contract to `Remix` to deploy.
4. At deploy and run transactions, in the Environment select Inject to connect your metamask as the transaction address.
5. At At_Address, enter your snowtrace address and click it.
6. Now you are ready to interact with it, click the drop-down interaction.

### Contract interaction

- Mint new tokens: mint(address, amount)
- Burn tokens: burnTokens(amount)
- Redeem tokens for in-game items: redeemTokens(itemId)
- Check redeemed items: getRedeemedItems(account)
- Check token balance: checkTokenBalance(account)

##Functions
- mint(address to, uint256 amount): The owner can mint new tokens to any address.
- burnTokens(uint256 amount): Allows users to burn a specified amount of tokens.
- redeemTokens(uint256 itemId): Users can redeem in-game items by burning tokens.
- getRedeemedItems(address account): Checks the list of redeemed items for a user.
- checkTokenBalance(address account): Allows users to check their token balance.
## Help

- Make sure the Metamask wallet is connected to the Avalanche Fuji network.
- Add an .env file for your API wallet private key


## Author

Henrick Brian M. Nadonga
(https://github.com/nrbDenji)

## License

This project is licensed under the MIT
