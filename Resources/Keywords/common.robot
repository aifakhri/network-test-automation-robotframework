*** Settings ***
Documentation       Common Keyword
Library             ../../Libraries/commonLib.py
Variables           ../../Data/devices/${DEVICE}.yaml

*** Variables ***
${managementIp}     ${interfaces.management.ipv4Addr}

*** Keyword ***
Open Connection to Device
    ${connection}                 connection        ${managementIp}
    Set Suite Variable            ${connection}

Close Connection to Device
    close_connect                 ${connection}

# Getting device information
#     Log to Console      ${managementIp}