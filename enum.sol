//SPDX-License-Identifier:MIT
pragma solidity ^0.8.1;

contract Student {
    address public principal;
    enum AdmissionStatus {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    AdmissionStatus public currentStatus;

    constructor() {
        principal = msg.sender;
        currentStatus = AdmissionStatus.Pending;
    }

    function setStatus(AdmissionStatus _status) public {
        currentStatus = _status;
    }

    function getCurrentStatus()
        public
        view
        returns (AdmissionStatus r, string memory y)
    {
        if (currentStatus == AdmissionStatus.Pending) {
            return (currentStatus, "pending");
        } else if (currentStatus == AdmissionStatus.Shipped) {
            return (currentStatus, "shipped");
        } else if (currentStatus == AdmissionStatus.Accepted) {
            return (currentStatus, "Accepted");
        } else if (currentStatus == AdmissionStatus.Rejected) {
            return (currentStatus, "Rejected");
        } else if (currentStatus == AdmissionStatus.Canceled) {
            return (currentStatus, "Canceled");
        }
    }
}
