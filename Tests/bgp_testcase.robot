*** Settings ***
Documentation       This is BGP Test Cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/bgpRouting.robot
Suite Setup         Open Connection to Device
Suite Teardown      Close Connection to Device


*** Test Cases ***
Test Case: Get BGP Status
    [Documentation]     First Step of Testing
    Getting BGP Status