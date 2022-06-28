*** Settings ***
Documentation     BGP Related Keyword
Library           ../../Libraries/bgpEvpn.py


*** Keywords ***
Verify BGP EVPN Neighboring State
    ${peerStatus}           Bgp Evpn Neighbor Status    ${connection}
    Log to Console          ${peerStatus}

Verify BGP Prefix is in Routing Table
    ${prefixNumber}         Get Evpn Prefix             ${connection}   ${evpn_peer_ipaddr}

Verify BGP EVPN Advertisement
    ${advertStatus}         Bgp Evpn Advetisement       ${connection}   ${evpn_peer_ipaddr}

Verify BGP EVPN Instance Support Vxlan
    ${evpnInstance}         Bgp Evpn Instance           ${connection}            