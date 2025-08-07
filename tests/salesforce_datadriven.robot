*** Settings ***
Library                      QForce
Library    QWeb
Library                      DateTime
Library    DataDriver    reader_class=TestDataApi    name=salesforce_test.xlsx
Resource                     ../resources/salesforce_common.resource
Suite Setup                  OpenBrowser                 about:blank            chrome
Suite Teardown    Close All Browsers
Test Template    Create Opportunity From Excel Data


*** Variables ***
${BROWSER}                   chrome


*** Test Cases ***
Create Opportunity From Excel Data with ${opportunity_name} ${account_name} ${type} ${stage} ${amount} ${probability} ${description}
    [Tags]    Datadriven_opp

*** Keywords ***
Create Opportunity From Excel Data
    [Documentation]          Template keyword to create opportunity with Excel data
    [Arguments]              ${opportunity_name}         ${account_name}        ${type}    ${stage}   ${amount}    ${probability}    ${description}

    ${current_timestamp}=    Get Current Date
    ${close_date}=           Generate Future Date One Month

    # Navigate to the page URL
    GoTo                     ${URL}

    # Login to Salesforce
    Login To Salesforce

    # Navigate to Sales app
    Launch App               Sales
    Verify Text              Sales                       timeout=20

    # Navigate to Sales app
    Launch App               Sales
    Verify Text              Sales                       timeout=20

    # Navigate to Opportunities tab
    Click Text               Opportunities
    Verify Text              Opportunities               timeout=15

    # Open New Opportunity creation window
    Click Text               New
    Use Modal                On
    Verify Text              New Opportunity             timeout=10

    # Fill all opportunity fields with Excel data
    Type Text                *Opportunity Name           ${opportunity_name}
    Type Text                Search Accounts...          ${account_name}
    Click Text               ${account_name}
    Pick List                Type                        ${type}

    # Set close date based on offset from Excel
    TypeText                 *Close Date                 ${close_date}

    Pick List                *Stage                      ${stage}

    # Fill additional fields from Excel data
    Type Text                Amount                      ${amount}
    Type Text                Probability (%)             ${probability}
    Type Text                Description                 ${description}

    Click Text               Save & New
    Use Modal                Off

    # Verify opportunity was created successfully
    Verify Text              ${opportunity_name}         timeout=10

    # Log successful completion with all data
    Log                    New Opportunity form opened successfully - ready for data entry
