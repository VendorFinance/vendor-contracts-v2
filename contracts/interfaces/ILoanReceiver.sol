// SPDX-License-Identifier: TO BE DECIDED
/**
 * @title Interface for Loan Receiver contract
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * @dev - Have a nice day.
 */
pragma solidity ^0.8.0;

interface ILoanReceiver {
    function loanReceived(uint256 _amountReceived) external;
    function canReceive() external;
}