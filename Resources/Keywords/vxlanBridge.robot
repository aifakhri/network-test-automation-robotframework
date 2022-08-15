*** Settings ***
Documentation     Vxlan Related Keyword
Library           ../../Libraries/vxlanInstance.py
Variables         ../Variables/${DEVICE}.yaml


*** Variables ***
@{vnis}       @{vxlans}[vnis]


*** Keyword ***
VXLAN Bridge Mac Address Table
    FOR    ${expected}    IN    @{vnis}
        IF    "${expected}[serviceType]" == "bridged"
            ${macAddr}     vxlan mac address    ${connection}    ${expected}[mappedVlan]    ${expected}[remote][mac]
            Should Be True      ${macAddr}
        END
    END

VXLAN Bridged In EVPN Table
    FOR    ${expected}    IN    @{vnis}
        IF    "${expected}[serviceType]" == "bridged"
            ${macAddr}        vxlan evpn service    ${connection}    ${expected}[vniId]    ${expected}[remote][rd]    ${expected}[remote][mac]
            Should Be True    ${macAddr}
        END
    END