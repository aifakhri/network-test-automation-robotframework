*** Settings ***
Documentation       Common Keyword
Library             ../../Libraries/commonLib.py
Variables           ../Variables/${DEVICE}.yaml


*** Variables ***
${mgmtIp}         ${virtualBox.vmManagement.hostIp}
${port}           ${virtualBox.vmManagement.hostPort}
${user}           ${virtualBox.vmManagement.username}
${passwd}         ${virtualBox.vmManagement.password}
${devType}        ${virtualBox.vmType}


*** Keyword ***
Open Connection to Device
    ${connection}                 open connection    ${mgmtIp}    ${port}    ${user}    ${passwd}    ${devType}
    Set Suite Variable            ${connection}

Close Connection to Device
    close_connection              ${connection}