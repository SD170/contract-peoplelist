A basic solidity contract to add and display peoples with a few fields. 
## Installation

you need to have truffle and ganache-cli installed

1) Run ganache-cli in a terminal
```
ganache-cli 
```
2) After cloning this repository, go to /contract and try to compile using
```
truffle compile
```
3) migrate the contract (push the contract to the ETH blockchainm for me local) **only works if ganache-cli is running**
```
truffle migrate
```
that's all!!

4) If you wanna play with the contract and it's methods you can go to the console
```
truffle console
```
Now you can use:
To find the address of the contract in etherium blockchain:
```
People.address
```
To see all the details anout the Perople contract:
```
People.deployed()
```
To call **addPerson**:
```
People.deployed().then(d=>d.addPerson(web3.utils.toHex("John"), web3.utils.toHex("Doe"), 7))
```