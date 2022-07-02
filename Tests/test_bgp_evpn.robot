*** Settings ***
Documentation       This is BGP Test Cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/bgpEvpn.robot
Test Setup         Open Connection to Device
Test Teardown      Close Connection to Device

*** Test Cases ***
[Documentation] Step 1: Verify BGP EVPN Neighbor Status
    Verify BGP EVPN Neighbors State

[Documentation] Step 2: Verify BGP EVPN Prefix Count
    Verify BGP EVPN Received Prefix Count

[Documentation] Step 3: Verify BGP EVPN Neighbor Capabilities
    Verify BGP EVPN Neighbor Capabilities

[Documentation] Step 4: Verify BGP EVPN Instance
    Verify BGP EVPN Instance Support Vxlan