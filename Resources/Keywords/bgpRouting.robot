*** Settings ***
Documentation     BGP Related Keyword
Library           ../../Libraries/bgpRouting.py
Variables         ../Variables/${DEVICE}.yaml


*** Variables ***
@{bgpPeers}             @{routing.bgp.neighbors}


*** Keywords ***
BGP Neighboring State
    FOR     ${peer}     IN      @{bgpPeers}
        IF      "${peer.type}" == "ebgp"
            ${peerState}        bgp status       ${connection}       ${peer.address}
            Should Be Equal     "${peerState}"    "Established"
        END
    END

BGP Prefix Count in Routing Table
    ${prefixCount}         bgp routes          ${connection}
    Should be True          ${prefixCount} > 0