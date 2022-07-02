*** Settings ***
Documentation     BGP Related Keyword
Library           ../../Libraries/bgpEvpn.py
Variables         ../../Data/devices/${DEVICE}.yaml


*** Variables ***
@{bgpPeers}        @{routing.bgp.neighbors}
@{vlans}           @{vlans}

*** Keywords ***
Verify BGP EVPN Neighbors State
    FOR     ${peer}      IN      @{bgpPeers}
        IF      "${peer.type}" == "evpn"
            ${evpnPeerState}     bgp evpn neighbor status    ${connection}    ${peer.address}
            Should Be Equal      ${evpnPeerState}       Established
            Log                  "BGP EVPN Peer ${evpnPeerState} state is ${evpnPeerState}"
        END
    END

Verify BGP EVPN Received Prefix Count
    FOR     ${peer}      IN      @{bgpPeers}
        IF      "${peer.type}" == "evpn"
            ${prefixCount}     bgp evpn prefix    ${connection}    ${peer.address}
            Should Be True     ${prefixCount} > 0
            Log                "BGP EVPN Peer Received Prefix Count is ${prefixCount}"
        END
    END

Verify BGP EVPN Neighbor Capabilities
    FOR     ${peer}      IN      @{bgpPeers}
        IF      "${peer.type}" == "evpn"
            ${capabilities}    bgp evpn neighbor caps    ${connection}    ${peer.address}
            Should Be True    ${capabilities}[enabled]
            Should Be True    ${capabilities}[received]
            Should Be True    ${capabilities}[advertised]
            Log                "BGP EVPN is enabled, and can received and advertised prefix"
        END
    END
    
    
# Verify BGP EVPN Instance Support Vxlan
#     ${evpnInstance}         Bgp Evpn Instance           ${connection}            