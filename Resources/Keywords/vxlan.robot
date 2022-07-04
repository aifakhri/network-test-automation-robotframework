*** Settings ***
Documentation     Vxlan Related Keyword
Library           ../../Libraries/vxlanInstance.py
Variables         ../../Data/devices/${DEVICE}.yaml


*** Variables ***
${vxlanInt}       ${interfaces}[vxlans][1][intName]


*** Keyword ***
Vxlan Interface Status
    ${intStatus}        vxlan status      ${connection}    ${vxlanInt}
    Should Be Equal     ${intStatus}      up

Mapped Vlan to VNI
    FOR    ${expected}    IN    @{vnis}
        ${actualVni}        vxlan vni mapping    ${connection}    ${vxlanInt}   ${expected}[mappedVlan]
        Should Be Equal     "${actualVni}"    "${expected}[vniId]"
    END

Vxlan Control Plane
    FOR    ${expected}    IN    @{vnis}
        ${controlPlane}     vxlan control plane    ${connection}    ${expected}[mappedVlan]
        Should Be Equal     ${controlPlane}        EVPN
    END