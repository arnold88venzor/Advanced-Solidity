pragma solidity ^0.5.5;

import "./PupperCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";

// @TODO: Inherit the crowdsale contracts
contract PupperCoinSale is Crowdsale,MintedCrowdsale,CappedCrowdsale,TimedCrowdsale, RefundablePostDeliveryCrowdsale {

    constructor(
        // @TODO: Fill in the constructor parameters!
        uint rate,
        address payable wallet,
        PupperCoin token,
        uint256 goal,
        uint256 open,
        uint256 close
        )
    
        // @TODO: Pass the constructor parameters to the crowdsale contracts.
        Crowdsale(rate,wallet,token)
        RefundableCrowdsale(goal)
        TimedCrowdsale(open,close)
        CappedCrowdsale(goal)
        
        public
        {
        // constructor can stay empty
        }
    
    
    
}
contract PupperCoinSaleDeployer {

    address public token_sale_address;
    address public token_address;
    //uint256 cap;
    //uint256 goal;
    uint256 open;
    uint256 close;
    

    constructor(
        // @TODO: Fill in the constructor parameters!
        string memory name,
        string memory symbol,
        address payable wallet,
        ///uint256 cap,
        uint256 goal
        )
        
        
        public
        {
            // @TODO: create the PupperCoin and keep its address handy
            
            PupperCoin token = new PupperCoin(name,symbol,0);
                token_address = address(token);

            // @TODO: create the PupperCoinSale and tell it about the token, set the goal, and set the open and close times to now and now + 24 weeks.
            goal = 300;
            open = now;
            close = now + 24 weeks;
            
            
            PupperCoinSale token_sale = new PupperCoinSale(1,wallet,token,goal,open,close);
                token_sale_address = address(token_sale);
