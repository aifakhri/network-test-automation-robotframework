*** Settings ***
Documentation       Common Keyword
Library             ../../Libraries/commonLib.py
Variables           ../Variables/${DEVICE}.yaml


*** Variables ***
${managementIp}         ${virtualBox.vmManagement.hostIp}
${port}                 ${virtualBox.vmManagement.hostPort}

*** Keyword ***
Open Connection to Device
    ${connect}                    connection     ${managementIp}     ${port}
    Set Suite Variable            ${connect}

Close Connection to Device
    close_connection              ${connect}