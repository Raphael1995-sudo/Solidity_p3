// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {

    struct Address_book
    {
        address addr;
        string data;
    }

    Address_book[] public address_book;
 
    function push(string memory _text) external {
        Address_book memory entry;
        entry.addr = msg.sender;
        entry.data = _text;
        address_book.push(entry);
    }

    function get_all() external view returns(Address_book[] memory)
    {
        return(address_book);
    }

    function get() public view returns(string[] memory)
    {
        string[] memory address_data =  new string[](address_book.length);
        uint j = 0;
    
        for(uint i = 0; i < address_book.length; i++)
        {
            if(address_book[i].addr == msg.sender)
            {
                address_data[j] = address_book[i].data;
                j++;
            }
        }
        return(address_data);
    }
}