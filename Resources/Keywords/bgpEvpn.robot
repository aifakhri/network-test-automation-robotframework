*** Settings ***
Documentation     BGP Related Keyword
Library           ../../Libraries/bgpEvpn.py
Variables         ../../Data/devices/${DEVICE}.yaml


*** Variables ***
@{bgpPeers}          @{routing.bgp.neighbors}
${bgpEvpnFeature}    ${features.bgpEvpn}

*** Keywords ***
Verify BGP EVPN Neighbors State
    Pass Execution       ${bgpEvpnFeature} == ${false}
    FOR     ${peer}      IN      @{bgpPeers}
        IF      "${peer}[type]" == "evpn"
            ${evpnPeerState}     bgp evpn neighbor status    ${connection}    ${peer}[address]
            Should Be Equal      ${evpnPeerState}       Established
        END
    END

Verify BGP EVPN Received Prefix Count
    Pass Execution       ${bgpEvpnFeature} == ${false}
    FOR     ${peer}      IN      @{bgpPeers}
        IF      "${peer}[type]" == "evpn"
            ${prefixCount}     bgp evpn prefix    ${connection}    ${peer}[address]
            Should Be True     ${prefixCount} > 0
        END
    END

Verify BGP EVPN Neighbor Capabilities
    Pass Execution       ${bgpEvpnFeature} == ${false}
    FOR     ${peer}      IN      @{bgpPeers}
        IF      "${peer}[type]" == "evpn"
            ${capabilities}    bgp evpn neighbor caps    ${connection}    ${peer}[address]
            Should Be True     ${capabilities}[enabled]
            Should Be True     ${capabilities}[received]
            Should Be True     ${capabilities}[advertised]
        END
    END
    
    
Verify BGP EVPN Instance Support Vxlan
    Pass Execution       ${bgpEvpnFeature} == ${false}
    FOR     ${vlan}      IN      @{vlans}
        ${vxlanInstance}      Bgp Evpn Instance    ${connection}    ${vlan}[vlanId]    
        Should Be True        ${vxlanInstance}
    END            