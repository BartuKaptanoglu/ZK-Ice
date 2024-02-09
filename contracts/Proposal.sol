// SPDX-License-Identifier: MIT
pragma solidity >=0.8.10 <0.9.0;

contract DAOVoting{
   Proposal[] public proposals;
   uint256 id=0;
   struct Proposal{
    uint256 deadline;
    uint256 yesVotes;
    uint256 noVotes;
    uint256 proposalID;
    uint256 nonCommitalVotes;
    string proposalTitle;
    string proposalBody; 
    bool executed;
   }
   enum VOTES{
      YES, ///1
      NO, ///-1
      MAYBE ///0
   }
   mapping(uint256 => mapping(uint256 => bool)) votersForEachProposal;
   function createProposal(string memory _proposalTitle, string memory _proposalBody) public {
      Proposal(0,0,0,id,0,_proposalTitle,_proposalBody,false);
      id++;
   }
   function submitProposal(Proposal storage proposalTemplate) internal {
      proposalTemplate.deadline=block.timestamp+5 minutes;
      proposals.push(proposalTemplate);
   }
  
}
