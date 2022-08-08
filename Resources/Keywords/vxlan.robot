*** Settings ***
Documentation     Vxlan Related Keyword
Library           ../../Libraries/vxlanInstance.py
Variables         ../../Variables/${DEVICE}.yaml


*** Variables ***
${vxlanInt}             ${interfaces}[vxlans][1][intName]


*** Keyword ***
VXLAN Interface Status
    ${intStatus}        vxlan status      ${connection}    ${vxlanInt}
    Should Be Equal     ${intStatus}      up

Mapped VLAN to VNI
    FOR    ${expected}    IN    @{vnis}
        ${actualVni}        vxlan vni mapping    ${connection}    ${vxlanInt}   ${expected}[mappedVlan]
        Should Be Equal     "${actualVni}"    "${expected}[vni]"
    END