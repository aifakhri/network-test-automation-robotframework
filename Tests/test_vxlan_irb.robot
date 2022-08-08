*** Settings ***
Documentation       This is BGP Test Cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/vxlanIrb.robot
Test Setup         Open Connection to Device
Test Teardown      Close Connection to Device



*** Test Cases ***
[Documentation] Step 1: Verify VXLAN IRB Service Remote Mac Address
    VXLAN IRB Service Remote Mac Address

[Documentation] Step 2: Verify VXLAN Bridged Service in EVPN Table
    VXLAN IRB Service In EVPN Table

[Documentation] Step 3: Verify ARP for IRB Service Customer VRF
    VXLAN VRF ARP Remote Mac Address