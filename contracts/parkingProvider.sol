// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract driversContract {
    
   struct driver{
      uint id;
    //   string parkingId; // auto - generated
      string emailId;
      string name;
      address walletAddress;
      string vehicleType;
   }
  
   driver[] public drivers; 

   uint256 public totaldrivers;
  
  
   constructor() {
      totaldrivers = 0;
   }

   // creating a new paking lot if it is not already created
   function createDriver( string memory emailId ,address payable walletAddress, string memory name,string memory vehicleType) public returns (int){

      drivers.push(driver(totaldrivers+1,emailId,name,walletAddress,vehicleType));
      totaldrivers++;
      
      return int(totaldrivers);
   }

   
   // delete a parking lot
   function deletedriver(uint id) public returns(bool success){

      // if id is not valid
      if(id>=totaldrivers)    return false;

      drivers[id]=drivers[totaldrivers-1];
      delete drivers[totaldrivers-1];
      totaldrivers--;
      return true;
   }
   
     
   function getdriver(uint id) public view returns(driver memory){
      return drivers[id];
   }     
   
   
   function getTotaldrivers() public view returns (uint256 Totaldrivers){
      return totaldrivers;
   }
}