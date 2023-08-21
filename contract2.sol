//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

import "./contract.sol";

contract studentDetailsFactory {
    StudentDetails[] Details;

    function createStudentDetails()
        external
        returns (StudentDetails newDtails)
    {
        // create a new contract and assign newDetails the new contract address
        newDtails = new StudentDetails(msg.sender);

        // push the newDetails to state
        Details.push(newDtails);
    }
}
