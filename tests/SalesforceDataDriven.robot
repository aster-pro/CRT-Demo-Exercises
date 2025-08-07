*** Settings ***
Library                      QForce
Library                      DateTime
Resource                     ../resources/Salesforce.resource
Suite Setup                  Open Browser                about:blank                 chrome
Test Template                Example Test


*** Test Cases ***
Salesforce Login And Navigate To Services App
    [Documentation]          Test case to login to Salesforce, verify successful login,
    ...                      navigate to app launcher, open Services app and verify navigation
    [Tags]                   DataDriver


*** Keywords ***

Example Test
    [Arguments]              ${opportunity_name}         ${probability}              ${amount}    ${account_name}    ${stage}
    # Go to the log in page
    GoTo                     ${URL}

    # Perform login with credentials
    Log In

    # Navigate to app launcher and click Sales
    LaunchApp                Sales

    # Verify we are on the Sales app
    Verify Text              Sales                       timeout=15

    #Click opportunities
    Click Text               Opportunities

    #Get a timestamp
    ${current_timestamp}=    Get Current Date

    #Create a new Oportunnity
    ClickText                New
    UseModal                 On
    TypeText                 *Close Date                 12/31/2024
    TypeText                 *Opportunity Name           ${current_timestamp}-${opportunity_name}
    PickList                 *Stage                      ${stage}
    ComboBox                 Search Accounts...          ${account_name}

    PickList                 Type                        New Business
    TypeText                 Amount                      ${amount}
    PickList                 Lead Source                 Public Relations
    TypeText                 Next Step                   test
    TypeText                 Description                 opportunities test
    TypeText                 Probability(%)              ${probability}
    ClickText                Save                        partial_match=False
    UseModal                 Off