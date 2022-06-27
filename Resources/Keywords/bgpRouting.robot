*** Settings ***
Documentation     BGP Related Keyword
Library           ../../Libraries/bgpRouting.py


*** Keywords ***
Getting BGP Status
    ${peerStatus}           Get Bgp Status          ${connection}
    Log to Console          ${peerStatus}