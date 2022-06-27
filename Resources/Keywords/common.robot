*** Settings ***
Documentation       Common Keyword
Library             ../../Libraries/commonLib.py


*** Keyword ***
Open Connection to Device
    ${connection}                 connection
    Set Suite Variable            ${connection}

Close Connection to Device
    close_connect                 ${connection}