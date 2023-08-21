//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

// a record of student in a university
// allows only principal to admit, expell

contract StudentDetails {
    address public principal;
    address public deployer;

    struct Student {
        string name;
        uint age;
        string gender;
    }
    uint id; //total numba of student which is 0 here

    mapping(uint => Student) _student;

    event Admitted(string indexed _name, uint _age, string _gender, uint _id);

    constructor(address _prin) {
        principal = _prin;
        deployer = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == principal, "not principal");
        _;
    }

    function admitStudent(
        string memory _name,
        uint _age,
        string memory _gender
    ) external onlyOwner {
        id = id + 1; // this increaments additional student
        Student storage newStudent = _student[id];
        newStudent.name = _name;
        newStudent.age = _age;
        newStudent.gender = _gender;

        emit Admitted(_name, _age, _gender, id);
    }

    function expell(uint _id) external onlyOwner {
        delete _student[_id];
    }

    function getStudentDetail(
        uint _id
    ) external view returns (Student memory _s) {
        _s = _student[_id];
    }
}
