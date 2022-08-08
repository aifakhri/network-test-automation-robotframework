*** Settings ***
Documentation       Vxlan Test Cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/vxlan.robot
Test Setup         Open Connection to Device
Test Teardown      Close Connection to Device

*** Test Cases ***
[Documentation] Step 1: Verify VXLAN Interface Status
    VXLAN Interface Status

[Documentation] Step 2: Verify VLAN to VNI mapping
    Mapped VLAN to VNI