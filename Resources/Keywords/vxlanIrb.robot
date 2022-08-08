*** Settings ***
Documentation     Vxlan IRB Service Keyword
Library           ../../Libraries/vxlanInstance.py
Variables         ../Variables/${DEVICE}.yaml


*** Variables ***
${vxlanInt}          ${interfaces}[vxlans][1][intName]
${customerVrf}       ${vrf}[customers][CUSTOMER02][vrfName]


*** Keyword ***
VXLAN IRB Service Remote Mac Address
    FOR    ${expected}    IN    @{vnis}
        IF    "${expected}[serviceType]" == "irb"
            ${macAddrList}     vxlan mac address     ${connection}    ${expected}[remoteMac]
            Should Be True      ${macAddrList}
        END
    END
    
            
VXLAN IRB Service In EVPN Table
    FOR    ${expected}    IN    @{vnis}
        IF    "${expected}[serviceType]" == "irb"
            ${pathCount}       vxlan evpn service    ${connection}    ${expected}[vni]    ${expected}[remoteRd]    ${expected}[remoteMac]
            Should Be True      ${pathCount} > 0
        END
    END

VXLAN VRF ARP Remote Mac Address
    FOR    ${expected}    IN    @{vnis}
        IF    "${expected}[serviceType]" == "irb"
            ${arpEntry}       vxlan vrf arp table    ${connection}    ${customerVrf}    ${expected}[remoteMac]
            Should Be True    ${arpEntry}
        END
    END