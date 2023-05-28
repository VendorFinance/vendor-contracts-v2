# Vendor Finance Version 2

Vendor Finance is a lending platform that facilitates lending and borrowing through fixed term, non-liquidatable loans. This ensures stability for both lenders and borrowers. Additionally, all loans come with an expiration date, and to enhance the borrowing experience, we have introduced the innovative concept of rollovers. Borrowers meeting specific criteria can seamlessly transfer their debt from one pool to another, even if the second pool hasn't been seeded yet, allowing for extended expiration periods. This feature emulates the endless borrowing capabilities seen in platforms like AAVE.

## Contracts

### Pool Factory

The `PoolFactory.sol` contract serves as the gateway to the protocol, enabling lenders to effortlessly deploy isolated pools by supplying the necessary parameters (refer to `Types.sol` for details). Upon deployment of a pool, the factory passes the user-provided parameters while also incorporating the predefined parameters established within the factory. It's worth highlighting that both the factory itself and the pools created through it are upgradeable, ensuring adaptability and flexibility within the system.

### Lending Pool

Every lending pool is generated with a combination of default parameters set by the factory and custom parameters specified by the lender. These parameters encompass essential details such as the collateral token, the lend token, the term rate, and more. Users directly interact with these isolated pools to perform various actions. For borrowers, this entails depositing collateral to receive lend funds. Lenders, on the other hand, can deposit or withdraw funds, pause or unpause lending activities, and more. Additionally, the platform offers functionality that allows borrowers to rollover their debt into eligible pools. For detailed information, please refer to the documentation.

### Lending Pool Utils

Contains helper functions used by lending pools.

### Position Tracker

From a user's standpoint, there is no way to write directly with the `PositionTracker.sol` contract. Its sole function revolves around seamless on-chain storage of user positions. Most positions are initiated and managed within the lending pools, except in scenarios where a pool is deployed with an initial deposit. In such cases, the factory takes responsibility for opening the position on behalf of the user.

### Fees Manager

Similar to the `PositionTracker.sol` contract, it is advised not to directly interact with this contract. Instead, it should be accessed through a pool, as this ensures accurate tracking of the pool associated with each transaction for the fees manager. By following this approach, the system maintains a clear and reliable record of the transactions tied to specific pools.

### Vendor ERC4626 Strategy

The `Vendor4626Strategy.sol` contract represents a significant evolution in the Vendor protocol, distinguishing itself prominently from v1. This strategy grants lenders the ability to utilize their idle funds, which refer to the funds they have deposited into their pool but have not yet been borrowed. The strategy achieves this by seamlessly channeling these idle funds directly into an external lending pool, with no extra steps required by the lender. Notably, the initial strategy introduced by Vendor involves the deployment of idle USDC into an AAVE lending pool.

### Oracle

The protocol allows lenders to set a maximum loan-to-value ratio that they would like to lend their funds out at. This protects lenders from volatility they might otherwise have to worry about. To achieve this, Chainlink price feeds are used.

### Generic Utils

Library that contains helper functions used throughout all pools.

## Audit

The smart contracts audit can be found within this repo, or you can visit: https://drive.google.com/file/d/1WvR7kY1t7pPHEDYZGEE6k6JWnAEd1I8X/view
