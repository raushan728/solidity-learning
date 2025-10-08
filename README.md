# Solidity Learning Repository

## Description

This repository contains a comprehensive collection of Solidity smart contract examples designed for learning and reference purposes. The contracts are organized sequentially, starting from basic concepts and progressing to advanced topics such as security patterns, token standards, and low-level operations. Each file demonstrates a specific Solidity feature or best practice, with clear code comments for educational value.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [File List](#file-list)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

- Solidity compiler (solc) version 0.8.20 or higher
- Node.js and npm (for testing with Hardhat or Truffle, if applicable)
- A development environment like Remix IDE, Visual Studio Code with Solidity extensions, or a local Ethereum development setup

## Setup

1. Clone the repository:
   ```
   git clone <repository-url>
   cd solidity-learning
   ```

2. Ensure you have the Solidity compiler installed. You can install it via npm:
   ```
   npm install -g solc
   ```

3. For testing and deployment, consider setting up a development framework like Hardhat:
   ```
   npm install --save-dev hardhat
   npx hardhat init
   ```

## File List

The following is a detailed list of all Solidity contract files in this repository, along with brief descriptions of the concepts they demonstrate:

1. **01_HelloWorld.sol** - Basic contract structure with state variables, constructor, functions, and events.
2. **02_DataTypes.sol** - Overview of Solidity's built-in data types (uint, int, bool, address, etc.).
3. **03_Variables.sol** - Declaration and usage of state and local variables.
4. **04_ConstantsImmutables.sol** - Use of constants and immutable variables for gas optimization.
5. **05_Functions.sol** - Function definitions, parameters, return values, and modifiers.
6. **06_Visibility.sol** - Public, private, internal, and external function and variable visibility.
7. **07_Modifiers.sol** - Custom function modifiers for access control and validation.
8. **08_Constructors.sol** - Contract initialization using constructors.
9. **09_Inheritance.sol** - Single inheritance between contracts.
10. **10_MultiInheritanceOverride.sol** - Multiple inheritance and function overriding.
11. **11_Interface.sol** - Defining and implementing interfaces.
12. **12_Abstract.sol** - Abstract contracts and their usage.
13. **13_Events.sol** - Emitting and handling events in contracts.
14. **14_ErrorsRequireRevert.sol** - Error handling using require, revert, and assert.
15. **15_Mapping.sol** - Usage of mapping data structures.
16. **16_Arrays.sol** - Fixed and dynamic arrays, array operations.
17. **17_Structs.sol** - Defining and using custom data structures (structs).
18. **18_Enums.sol** - Enumeration types and their applications.
19. **19_DataLocations.sol** - Storage, memory, and calldata data locations.
20. **20_ViewPure.sol** - View and pure function modifiers for read-only operations.
21. **21_Payable.sol** - Functions that can receive Ether.
22. **22_FallbackReceive.sol** - Fallback and receive functions for handling Ether transfers.
23. **23_Units.sol** - Working with Ether units (wei, gwei, ether) and time units.
24. **24_Gas.sol** - Gas optimization techniques and considerations.
25. **25_Library.sol** - Creating and using library contracts.
26. **26_ImportDemo.sol** - Importing contracts and libraries.
27. **27_Overloading.sol** - Function and operator overloading.
28. **28_Pausable.sol** - Implementing pausable functionality in contracts.
29. **29_Keccak.sol** - Using Keccak256 hashing functions.
30. **30_ECDSA.sol** - Elliptic Curve Digital Signature Algorithm implementation.
31. **31_Ownable.sol** - Ownership pattern for contract access control.
32. **32_Reentrancy_Unsafe.sol** - Example of vulnerable reentrancy attack.
33. **33_Reentrancy_Safe.sol** - Secure implementation with reentrancy guard.
34. **34_PullPayments.sol** - Pull payment pattern to prevent reentrancy.
35. **35_Auction.sol** - Simple auction contract implementation.
36. **36_ERC20_Min.sol** - Minimal ERC20 token standard implementation.
37. **37_ERC20_Mintable.sol** - ERC20 token with minting functionality.
38. **38_ERC721_Min.sol** - Minimal ERC721 (NFT) token standard implementation.
39. **39_SafeMathBuiltIn.sol** - Using Solidity's built-in SafeMath operations.
40. **40_TryCatch.sol** - Try-catch error handling in external calls.
41. **41_Create2.sol** - Using CREATE2 opcode for deterministic contract deployment.
42. **42_Delegatecall.sol** - Delegatecall for calling functions in other contracts.
43. **43_LowLevelCall.sol** - Low-level call, staticcall, and delegatecall operations.
44. **44_Assembly.sol** - Inline assembly for advanced optimizations and operations.

## Usage

This repository provides examples that can be run and tested using various Solidity development environments. Below are detailed instructions for using Remix IDE and Hardhat.

### Using Remix IDE

Remix is a web-based IDE suitable for quick testing and learning.

1. Open your web browser and navigate to [remix.ethereum.org](https://remix.ethereum.org).

2. Create a new file for each contract:
   - Click the "+" icon in the File Explorers panel.
   - Name the file (e.g., `HelloWorld.sol`).
   - Copy and paste the contract code from the corresponding file in this repository.

3. Compile the contract:
   - Select the Solidity compiler tab.
   - Choose the appropriate compiler version (0.8.20 or higher).
   - Click "Compile" for the selected file.

4. Deploy the contract:
   - Switch to the "Deploy & Run Transactions" tab.
   - Select "JavaScript VM" for local testing or connect to a testnet like Sepolia.
   - Click "Deploy" to deploy the contract to the selected environment.

5. Interact with the deployed contract:
   - Use the deployed contract interface to call functions and view state variables.
   - Observe transaction results and event logs in the console.

### Using Hardhat

Hardhat is a development environment for compiling, testing, and deploying Solidity contracts.

1. Ensure Node.js and npm are installed on your system.

2. Set up a Hardhat project in the repository directory:
   ```
   npm init -y
   npm install --save-dev hardhat
   npx hardhat init
   ```
   - Choose "Create a JavaScript project" when prompted.

3. Copy the Solidity files from this repository into the `contracts/` directory of your Hardhat project.

4. Compile the contracts:
   ```
   npx hardhat compile
   ```

5. Create a deployment script (e.g., `scripts/deploy.js`):
   ```javascript
   const { ethers } = require("hardhat");

   async function main() {
     const Contract = await ethers.getContractFactory("ContractName");
     const contract = await Contract.deploy(/* constructor arguments */);
     await contract.deployed();
     console.log("Contract deployed to:", contract.address);
   }

   main().catch((error) => {
     console.error(error);
     process.exitCode = 1;
   });
   ```
   Replace "ContractName" with the actual contract name (e.g., "HelloWorld").

6. Start a local Hardhat network:
   ```
   npx hardhat node
   ```

7. Deploy the contract in a new terminal:
   ```
   npx hardhat run scripts/deploy.js --network localhost
   ```

8. For testing, create test files in the `test/` directory using Mocha and Chai, or interact with the deployed contract using Hardhat console.

### Additional Options

- **Command Line Compilation**: Use the Solidity compiler directly:
  ```
  solc --bin --abi 01_HelloWorld.sol
  ```

- **Integration**: These contracts can be integrated into larger projects or used as templates for your own smart contract development. For production use, always conduct thorough testing and security audits.

## Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Add clear, educational comments to any new code.
4. Ensure all contracts compile without warnings.
5. Test your changes thoroughly.
6. Submit a pull request with a detailed description of your changes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
