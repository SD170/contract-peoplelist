A basic solidity contract to add and display people details with a few related fields. 
## Installation

you need to have truffle and ganache-cli installed

1) Run ganache-cli in a terminal
```
ganache-cli 
```
2) After cloning this repository, go to `/contract` and try to compile using
```
truffle compile
```
3) migrate the contract (deploy the contract to the ETH blockchain for me local) **only works if ganache-cli is running**
```
truffle migrate
```
that's all!!

4) If you wanna play with the contract and its methods you can go to the console
```
truffle console
```
Now you can use:
To find the address of the contract in the Ethereum blockchain:
```
People.address
```
To see all the details about the People contract:
```
People.deployed()
```
To call **addPerson()**:
```
People.deployed().then(d=>d.addPerson(web3.utils.toHex("John"), web3.utils.toHex("Doe"), 7))
```
