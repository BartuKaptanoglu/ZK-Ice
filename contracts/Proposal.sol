// SPDX-License-Identifier: MIT
pragma solidity >=0.8.10 <0.9.0;

contract DAOVoting {
    struct Proposal {
        uint256 deadline;
        uint256 proposalID;
        int256 votes;
        string proposalBody;
        bool executed;
    }

    Proposal[] public proposals;
    Proposal[] public proposalsQueForExec;
    uint256 public id = 0;
    mapping(uint256 => mapping(uint256 => bool)) private votersForEachProposal;

    function createProposal(string memory _proposalBody) public {
        Proposal memory newProposal = Proposal(block.timestamp + 5 minutes, id, 0, _proposalBody, false);
        submitProposal(newProposal);
        id++;
    }
   function modifyTitle(uint256 _proposalID, string memory _proposalBody) public{
      for (uint i = 0; i < proposals.length; i++){
         if(proposals[i].proposalID=_proposalID){
            proposals[i].proposalBody = _proposalBody;
         }


      }

   }
    function submitProposal(Proposal memory proposalTemplate) internal {
        proposals.push(proposalTemplate);
    }

    function voteOnProposal(uint256 _uID, uint256 _proposalID, int8 _vote) public {
        require(votersForEachProposal[_proposalID][_uID] == false, "YOU CAN'T VOTE ON THIS");
        for (uint i = 0; i < proposals.length; i++) {
            if (proposals[i].proposalID == _proposalID) {
                proposals[i].votes += _vote;
                votersForEachProposal[_proposalID][_uID] = true;
            }
        }
    }

    function executeProposal(uint256 _proposalID) public {
        require(block.timestamp > proposals[_proposalID].deadline, "Proposal deadline has not passed");
        require(!proposals[_proposalID].executed, "Proposal already executed");

        if (proposals[_proposalID].votes > 0) {
            // TODO: IMPLEMENT PROPOSAL EXECUTION LOGIC HERE
            proposals[_proposalID].executed = true;
            // Move proposal to executed queue
            proposalsQueForExec.push(proposals[_proposalID]);
        }

        // Remove proposal from active list
        for (uint i = 0; i < proposals.length; i++) {
            if (proposals[i].proposalID == _proposalID) {
                proposals[i] = proposals[proposals.length - 1];
                proposals.pop();
                break;
            }
        }
    }
}
