*** Settings ***
Documentation       This is BGP Test Cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/mlag.robot
Test Setup         Open Connection to Device
Test Teardown      Close Connection to Device

*** Test Cases ***
[Documentation] Verify Local MLAG Status
    Verify MLAG Status

[Documentation] Verify Local MLAG Negotation Status
    Verify MLAG Negotiation State

[Documentation] Verify MLAG Member Status
    Verify MLAG Member Status