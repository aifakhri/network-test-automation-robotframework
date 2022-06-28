*** Settings ***
Documentation     BGP Related Keyword
Library           ../../Libraries/bgpRouting.py


*** Keywords ***
Verify BGP Neighboring State
    ${peerStatus}           Get Bgp Status          ${connection}
    Log to Console          ${peerStatus}

Check BGP Prefix is in Routing Table
    ${prefixNumber}         Get Bgp Routes          ${connection}