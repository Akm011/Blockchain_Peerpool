// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract parkingProvider {
    
   struct parkingLot{
      uint id;
    //   string parkingId; // auto - generated
      string emailId;
      string name;
      address walletAddress;
      uint fee;
      uint totalSlots;
      uint availableParkingSpots; // initially 0
      // location of parking lot (lattitude and longitude)
      int lattitudeInt;
      int lattitudeDec;
      int longitudeInt;
      int longitudeDec;
   }
  
   parkingLot[] public parkingLots; 

   uint256 public totalParkingLots;
  
  
   constructor() {
      totalParkingLots = 0;
   }

   // creating a new paking lot if it is not already created
   function createParkingLot( string memory emailId ,address payable walletAddress, string memory name, uint fee, uint totalSlots, int lattitudeInt,int lattitudeDec, int longitudeInt,int longitudeDec) public returns (int){

      parkingLots.push(parkingLot(totalParkingLots+1,emailId,name,walletAddress,fee,totalSlots,totalSlots,lattitudeInt,lattitudeDec,longitudeInt,longitudeDec));
      totalParkingLots++;
      
      return int(totalParkingLots);
   }

   // updating cost per hour
   function updateFee(uint id, uint fee) public returns (bool success){
      // if id is not valid
      if(id>=totalParkingLots)    return false;
      parkingLots[id].fee=fee;
      return true;
   }

   // updating total slots
   function updateTotalSlot(uint id, uint totalSlots) public returns (bool success){
      // if id is not valid
      if(id>=totalParkingLots)    return false;
      parkingLots[id].totalSlots=totalSlots;
      return true;
   }

   
   // delete a parking lot
   function deleteParkingLot(uint id) public returns(bool success){

      // if id is not valid
      if(id>=totalParkingLots)    return false;

      parkingLots[id]=parkingLots[totalParkingLots-1];
      delete parkingLots[totalParkingLots-1];
      totalParkingLots--;
      return true;
   }
   
     
   function getParkingLot(uint id) public view returns(parkingLot memory){
      return parkingLots[id];
   }     
   
   
   function getTotalParkingLots() public view returns (uint256 TotalParkingLots){
      return totalParkingLots;
   }
}