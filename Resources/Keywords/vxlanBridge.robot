*** Settings ***
Documentation     Vxlan Related Keyword
Library           ../../Libraries/vxlanInstance.py
Variables         ../Variables/${DEVICE}.yaml


*** Keyword ***
VXLAN Bridge Mac Address Table
    FOR    ${expected}    IN    @{vnis}
        IF    "${expected}[serviceType]" == "vxlan bridge"
            ${macAddr}     vxlan mac address    ${connection}    ${expected}[mappedVlan]    ${expected}[remote][mac]
            Should Be True      ${macAddr}
        END
    END

VXLAN Bridged In EVPN Table
    FOR    ${expected}    IN    @{vnis}
        IF    "${expected}[serviceType]" == "vxlan bridge"
            ${macAddr}        vxlan evpn service    ${connection}    ${expected}[vni]    ${expected}[remote][rd]    ${expected}[remote][mac]
            Should Be True    ${macAddr}
        END
    END