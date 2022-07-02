*** Settings ***
Documentation       This is BGP Test Cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/bgpEvpn.robot
Test Setup         Open Connection to Device
Test Teardown      Close Connection to Device

*** Test Cases ***
[Documentation] Simple documentation
    Verify BGP EVPN Neighbors State

[Documentation] Simple documentation 2
    Verify BGP EVPN Received Prefix Count

[Documentation] Simple documentation 3
    Verify BGP EVPN Neighbor Capabilities

[Documentation] Simple documentation 4
    Verify BGP EVPN Instance Support Vxlan