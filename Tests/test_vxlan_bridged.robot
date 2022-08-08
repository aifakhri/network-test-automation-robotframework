*** Settings ***
Documentation       This is BGP Test Cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/vxlanBridge.robot
Test Setup         Open Connection to Device
Test Teardown      Close Connection to Device



*** Test Cases ***
[Documentation] Step 1: Verify Remote Mac Address for Bridged Service
    VXLAN Bridge Mac Address Table

[Documentation] Step 2: Verify VXLAN Bridged Service in EVPN Table
    VXLAN Bridged In EVPN Table