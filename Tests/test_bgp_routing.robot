*** Settings ***
Documentation       This is BGP Test Cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/bgpRouting.robot
Test Setup         Open Connection to Device
Test Teardown      Close Connection to Device

*** Test Cases ***
[Documentation] Step 1: Verify BGP Neighbor State
    Verify BGP Neighboring State

[Documentation] Step 2: Verify BGP Routing in Routing Table
    Verify BGP Prefix is in Routing Table
