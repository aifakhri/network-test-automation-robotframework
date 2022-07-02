*** Settings ***
Documentation     BGP Related Keyword
Library           ../../Libraries/mlagInstance.py
Variables         ../../Data/devices/${DEVICE}.yaml

*** Variables ***
@{memberId}         @{mlag.memberId}

*** Keywords ***
Verify MLAG Status
    ${mlagState}        mlag state      ${connection}
    Should Be Equal     ${mlagState}    active

Verify MLAG Negotiation State
    ${mlagNegState}     mlag negotiation state    ${connection}
    Should Be Equal     ${mlagNegState}           connected

Verify MLAG Member Status
    FOR    ${id}    IN    @{memberId}
        ${memberStatus}     mlag member status        ${connection}     ${id}
        Should Be Equal     ${memberStatus}     active-full
    END     