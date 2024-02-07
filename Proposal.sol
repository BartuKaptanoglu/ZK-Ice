// SPDX-License-Identifier: MIT
pragma solidity >=0.8.10 <0.9.0;

contract DAOVoting{
  
   struct Proposal{
    uint256 nftTokenId;
    uint256 deadline;
    uint256 yesVotes;
    uint256 noVotes;
    uint256 proposalID;
    uint256 nonCommitalVotes;
    string proposalTitle;
    string proposalBody; 
   }
  
}
