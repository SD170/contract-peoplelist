// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.17; // use >= (not ^) as in migrations.json compiler.version may be different and we're using truffle

contract People {
    // we'll have a struct defining a single person, and an array containing different people.

    Person[] public people; // the people array

    struct Person {
        bytes32 firstName;
        bytes32 lastName;
        uint256 age;
    }

    // we return a boolean when we know this contract will be called by another contract,
    // thus validation for this function will be simpler.
    function addPerson(
        bytes32 _firstName,
        bytes32 _lastName,
        uint256 _age
    ) public returns (bool success) {
        Person memory newPerson; // saves on the memory of EVM.
        newPerson.firstName = _firstName;
        newPerson.lastName = _lastName;
        newPerson.age = _age;

        // this next snipple only changing the contract/blockchain state.
        people.push(newPerson);

        /**
            We can create a constant function (doesn't change state)
            We can create/keep variables in memort (doesn't change state)
            But, people.push(newPerson) does change the state.
        */

        return true;
    }

    /**
        returns all the Peoples.
        In solidity functions can't return struct (or array of structs in this case).
        so we'll return array of each data member of struct separately. (array of firstName/lastName/age)
        so, the return tuple will look like this: returns(string[], string[], uint[])


        Another issue: strings could be of any length, so creating an array of strings of different length can be an issue
        just like not knowing the col length in 2d array. Some programming language takes care of it for strings but not Solidity 

        so, we'll change the firstName and lastName into a fixed lengthm i.e change the datatype from string to bytes32.
        bytes32 is actually hex representation.


        so, from: 
        struct Person {
            string firstName;
            string lastName;
            uint age;
        }
        to:
        struct Person {
            bytes32 firstName;
            bytes32 lastName;
            uint age;
        }

        and we'll change the function params and returns also.


        PS: we can revert to string, as it supports now, also passing "strings";
        as from truffle console passing  strings like "eg" gives err we need to pass
        web3.toHex
    */

    function getPeople()
        public
        view
        returns (
            bytes32[] memory,
            bytes32[] memory,
            uint256[] memory
        )
    {
        uint256 length = people.length;
        bytes32[] memory firstNames = new bytes32[](length);
        bytes32[] memory lastNames = new bytes32[](length);
        uint256[] memory ages = new uint256[](length);
        // bytes32 memory lastNames = new bytes32[];
        // uint256 memory ages = new uint256[];

        // if we loop inside a function which can change state i.e not constant then, if the looping gets too long
        // we might be out of gas, in those cases we need to be casreful.
        for (uint256 i = 0; i < people.length; i++) {
            // we'll create a single person in memory while looping. Then keep/push
            // the firstName, lastName and age in their respective o/p arrays

            Person memory currentPerson;
            currentPerson = people[i];

            firstNames[i] = currentPerson.firstName;
            lastNames[i] = currentPerson.lastName;
            ages[i] = currentPerson.age;
        }

        return (firstNames, lastNames, ages);
    }
}
