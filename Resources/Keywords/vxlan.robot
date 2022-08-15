*** Settings ***
Documentation     Vxlan Related Keyword
Library           ../../Libraries/vxlanInstance.py
Variables         ../Variables/${DEVICE}.yaml


*** Variables ***
${feature}          ${features.vxlan}
${vxlanInt}         ${vxlans}[interface][intName]
@{vnis}             @{vxlans}[vnis]  


*** Keyword ***
VXLAN Interface Status
    Skip If             ${feature} == ${false}
    ${intStatus}        vxlan status      ${connection}    ${vxlanInt}
    Should Be Equal     ${intStatus}      up

Mapped VLAN to VNI
    Skip If             ${feature} == ${false}
    FOR    ${expected}    IN    @{vnis}
        ${actualVni}        vxlan vni mapping    ${connection}    ${vxlanInt}   ${expected}[mappedVlan]
        Should Be Equal     "${actualVni}"    "${expected}[vniId]"
    END