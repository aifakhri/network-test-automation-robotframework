*** Settings ***
Documentation     BGP Related Keyword
Library           ../../Libraries/bgpEvpn.py
Variables         ../Variables/${DEVICE}.yaml


*** Variables ***
@{bgpPeers}          @{routing.bgp.neighbors}
${feature}           ${features.bgpEvpn}


*** Keywords ***
BGP EVPN Neighbors State
    Skip if    ${feature} == ${false}
    FOR     ${peer}      IN      @{bgpPeers}
        IF      "${peer}[type]" == "evpn"
            ${evpnPeerState}     bgp evpn neighbor status    ${connection}    ${peer}[address]
            Should Be Equal      ${evpnPeerState}       Established
        END
    END

BGP EVPN Received Prefix Count
    Skip if    ${feature} == ${false}
    FOR     ${peer}      IN      @{bgpPeers}
        IF      "${peer}[type]" == "evpn"
            ${prefixCount}     bgp evpn prefix    ${connection}    ${peer}[address]
            Should Be True     ${prefixCount} > 0
        END
    END

BGP EVPN Neighbor Capabilities
    Skip if    ${feature} == ${false}
    FOR     ${peer}      IN      @{bgpPeers}
        IF      "${peer}[type]" == "evpn"
            ${capabilities}    bgp evpn neighbor caps    ${connection}    ${peer}[address]
            Should Be True     ${capabilities}[enabled]
            Should Be True     ${capabilities}[received]
            Should Be True     ${capabilities}[advertised]
        END
    END
    
    
BGP EVPN Instance Support VXLAN
    Skip if    ${feature} == ${false}
    FOR     ${vlan}      IN      @{vlans}
        ${vxlanInstance}      Bgp Evpn Instance    ${connection}    ${vlan}[vlanId]    
        Should Be True        ${vxlanInstance}
    END            