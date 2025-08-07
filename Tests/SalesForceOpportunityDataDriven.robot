*** Settings ***

Library                QForce
Library                DateTime
Resource               ../resources/salesforcecommon.resource
Suite Setup            Setup Browser
Library                DataDriver                  reader_class=TestDataApi    name=Opportunity.xlsx
Test Template          Opportunity

*** Variables ***
${BROWSER}             chrome
${USERNAME}            ${EMPTY}
${PASSWORD}            ${EMPTY}
${SF_URL}              https://ability-velocity-7734.scratch.my.salesforce.com/

*** Test Cases ***
Opportunity with     ${opportunity_name}     ${account_name} ${stage}  ${type}    ${amount}    ${probability}    ${lead_source}    ${next_step}    ${description}


*** Keywords ***
Opportunity
[Arguments]    ${opportunity_name}        ${account_name}    ${stage}    ${type}    ${amount}    ${probability}    ${lead_source}    ${next_step}    ${description}

    [Documentation]    Open Browser
    Open Browser       about:blank                 ${BROWSER}
    Go To              ${SF_URL}

    #Login To Salesforce
    # [Documentation]                              Perform login to Salesforce using credentials
    Type Text          Username                    ${USERNAME}
    Type Secret        Password                    ${PASSWORD}
    Click Text         Log In
    Verify Text        Seller Home

    # Create New Opportunity
    #[Documentation]                               Create a New Opportunity
    Click Text         Opportunities
    Verify Text        Opportunities
    Click Text         New
    Verify Text        New Opportunity
    #${current_date}=                              Get Current Date            result_format=%Y%m%d_%H%M%S
    #${opportunity_name}=                          Set Variable                Roberto${current_date}
    #Set Suite Variable                            ${opportunity_name}
    Type Text          Opportunity Name            ${opportunity_name}
    Pick List          Stage                       ${stage}
    Type Text          Close Date                  12/31/2025
    Type Text          Amount                      ${amount}
    Type Text          Probability (%)             12/31/2025
    Pick List          Type                        ${type}
    Pick List          Lead Source                 ${lead_source}
    Type Text          Next Step                   ${next_step}
    Type Text          Description                 ${description}
    ComboBox           Search Accounts...          ${account_name}             index=4

    Click Text         Save
    Verify Text        Opportunity "${opportunity_name}" was created.
    Log To Console     ${opportunity_name}
    LogScreenshot
    ClickText          Cancel and close