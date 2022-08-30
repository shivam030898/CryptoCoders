pragma solidity >=0.4.22 <0.9.0;

import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract CryptoCoders is ERC721,ERC721Enumerable {

    string[] public coders;

    mapping(string =>bool) _coderExists;

 constructor() ERC721("CryptoCoder", "CCS") {
    }
    function mint(string memory coder) public {
        require(!_coderExists[coder]);
        coders.push(coder);
        uint _id=coders.length-1;
        _mint(msg.sender, _id);
        _coderExists[coder]=true;
    }

       function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }
     function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}

