// (C) Dai Foundation
// (C) Nikolai Mushegian

pragma solidity ^0.4.19;

import 'ds-token/token.sol';

contract Choice {
    // HOW state:
    // 0: init
    // 1: sign
    // 2: pick bleg
    // 3: pick rube
    // 4: save bleg
    // 5: save rube
    uint8 public how;
    event How(uint8 how) anonymous;

    // pounds of blegs
    DSToken public bleg; 
    uint256 public lbs;

    // kilograms of rubes
    DSToken public rube; 
    uint256 public kgs;

    address public creator;
    address public chooser;

    uint40  public open;
    uint40  public shut;

    function Choice() {
        creator = msg.sender;
        how = 0;
        How(how);
    }

    function make( DSToken bleg_
                 , uint256 lbs_
                 , DSToken rube_
                 , uint256 kgs_
                 , address chooser_
                 , uint40 deadline_
                 )
    {
        require(msg.sender == creator);
        bleg = bleg_;
        lbs = lbs_;
        rube = rube_;
        kgs = kgs_;
        chooser = chooser_;
        how = 1;
        How(how);
    }

    function pick(bool pickBleg)
    {
        require(open <= now || now < shut);
        require(msg.sender == chooser);
        if( pickBleg ) {
            bleg.push(chooser, lbs);
            rube.push(creator, kgs);
            how = 2;
        } else {
            rube.push(chooser, kgs);
            bleg.push(creator, lbs);
            how = 3;
        }
        How(how);
    }

    function save(bool saveBleg)
    {
        require(shut < now);
        require(msg.sender == creator);
        if( saveBleg ) {
            bleg.push(creator, lbs);
            rube.push(chooser, kgs);
            how = 4;
        } else {
            rube.push(creator, kgs);
            bleg.push(chooser, lbs);
            how = 5;
        }
        How(how);
    }
}
