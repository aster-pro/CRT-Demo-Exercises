*** Settings ***
Library                         QForce
Library                         QWeb
Library                         DateTime
Library                         DataDriver                  reader_class=TestDataApi    name=salesforce_test.xlsx
Resource                        ../resources/salesforce_common.resource
# Suite Setup                     OpenBrowser                 about:blank                 chrome
Suite Teardown                  Close All Browsers
Test Template                   New DataDriven Opportunity


*** Variables ***
${BROWSER}                      chrome


*** Test Cases ***
New DataDriven Opportunity with ${opportunity_name} ${account_name}
    [Documentation]             Uses the test template to create a new opportunity for each rows data from excel file
    [Tags]                      Datadriven_opp

*** Keywords ***
Launch Salesforce
    OpenBrowser                 about:blank                 chrome
    GoTo                        ${URL}

Navigate to Sales app
    [Documentation]             Launches the Sales section in salesforce
    Launch App                  Sales
    Verify Text                 Sales                       timeout=20

Verify Service App Content
    [Documentation]             Verifies that Quarterly Performance and Assistant text are displayed
    Verify Text                 Quarterly Performance
    Verify Text                 Assistant

Navigate to Opportunities tab
    [Documentation]             Navigates to the Opportunities section from Sales app
    Click Text                  Opportunities
    Verify Text                 Opportunities               timeout=15

New DataDriven Opportunity
    [Documentation]             Creates a new opportunity with the data provided from excel file
    [Arguments]                 ${opportunity_name}         ${account_name}             ${type}                     ${stage}    ${amount}    ${probability}    ${description}

    # Variables for close date and timestamp
    ${current_timestamp}=       Get Current Date
    ${close_date}=              Generate Future Date One Month

    Launch Salesforce

    # Login to Salesforce
    Login To Salesforce
    Navigate to Sales app
    Navigate to Opportunities tab

    Click Text                  New
    Use Modal                   On
    Verify Text                 New Opportunity             timeout=10
    Type Text                   *Opportunity Name           ${opportunity_name}
    ComboBox                    Search Accounts...          ${account_name}
    Pick List                   Type                        ${type}
    TypeText                    *Close Date                 ${close_date}
    Pick List                   *Stage                      ${stage}
    Type Text                   Amount                      ${amount}
    Click Text                  Save & New
    Use Modal                   Off

    # Log successful completion with all data
    Log                         New Opportunity form opened successfully - ready for data entry
