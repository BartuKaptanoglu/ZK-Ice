///SPDX-License-Identifier: MIT
 pragma solidity >=0.8.10 <0.9.0;
 contract DAOVoting{ 
   Proposal[] public proposals; 
 Proposal[] public proposalsQueForExec; 
 uint256 id=0;
  struct user{ 
   uint uID;
   string name; 
   } struct 
   Proposal{ 
      uint256 deadline; 
      uint256 proposalID; 
      int256 votes; 
      string proposalBody; 
      bool executed; } 
      mapping(uint256 => mapping (uint256 => bool)) votersForEachProposal; 
      function createProposal( string memory _proposalBody) public 
      { Proposal(0,id,0,_proposalBody,false); id++; } 
      function submitProposal(Proposal storage proposalTemplate) internal {
          ///TODO: SEND PROPOSAL 
          proposalTemplate.deadline=block.timestamp+5 minutes; 
          proposals.push(proposalTemplate); 
      } function executeProposal(uint256 _proposalID) public{ 
            for (uint i = 0; i < proposals.length; i++)
            { if(proposals[i].proposalID==_proposalID){ 
               proposals[i] = proposals[proposals.length - 1]; 
               proposalsQueForExec.push( proposals[i]); proposals.pop(); } } 
               ///TODO: IMPLEMENT PROPOSAL 
               } 
      function voteOnProposal(uint _uID ,uint256 _proposalID, uint8 vote) internal{ 
         require(votersForEachProposal[_proposalID][_uID]==false,"YOU CAN'T VOTE ON THIS"); 
         for (uint i = 0; i < proposals.length; i++){
             if(proposals[i].proposalID==_proposalID){
                proposals[i].proposalID+=vote; votersForEachProposal[_proposalID][_uID]=true; 
                } 
                }
                 }
 }