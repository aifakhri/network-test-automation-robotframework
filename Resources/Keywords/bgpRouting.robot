*** Settings ***
Documentation     BGP Related Keyword
Library           ../../Libraries/bgpRouting.py
Variables         ../../Data/devices/${DEVICE}.yaml


*** Variables ***
@{bgpPeers}             @{routing.bgp.neighbors}


*** Keywords ***
Verify BGP Neighboring State
    FOR     ${peer}     IN      @{bgpPeers}
        IF      "${peer.type}" == "ebgp"
            ${peerState}        bgp status       ${connection}       ${peer.address}
            Log                 "$BGP Peer is ${peerState}"
            Should Be Equal     "${peerState}"    "Established"
        END
    END

Verify BGP Prefix is in Routing Table
    ${prefixCount}         bgp routes          ${connection}
    Log                     "BGP Prefix on Routing Table is ${prefixCount}"
    Should be True          ${prefixCount} > 0