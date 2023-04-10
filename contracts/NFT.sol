//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract crazyNFT721 is ERC721{
	address public owner;
	uint public tokenSupply=0;

	//Initialise the owner of the contract
	//owner will be the adddress that calls and deploys the token
	constructor(string _name,string _symbol) ERC721(_name,_symbol){
		owner = tx.origin;
	}  

	//minting function
	function _mint(string memory _tokenId, string memory _metadata) public {
		require(_tokenId==tokenSupply+1, "token Id not in order.");
		_safeMint(msg.sender,_tokenId);
		tokenSupply++;
	} 

	function burnToken(uint _tokenId)public {
		_burn(_tokenId);

	}
	function _ownerTransfer(address _from, address _to, uint _tokenId) public{
		
	}

	function getContactOwner() public returns(address){
		return owner;
	}

	function _getTokenOwner(uint _tokenId)public returns(address){
		return _ownerOf(_tokenId);
	}
}

contract crazyNFT20 is ERC20{
	constructor(string _name,string _symbol) ERC721(_name,_symbol){
		owner = tx.origin;
	}  

	function _mint(uint _amount, string memory _metadata) public {
		_mint()
	}

}