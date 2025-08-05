*** Settings ***
Library                QForce
Library                DateTime

*** Variables ***
${future_date}=    Get Current Date    increment=30 days    result_format=%m/%d/%Y
${timestamp}=      Get Current Date    result_format=%Y%m%d_%H%M%S
${random_name}=    Set Variable    TestOpp_${timestamp}
${Stage}    Prospecting
${Account}    Salesforce
${AccountIndex}    1
${LeadSource}    Web

*** Keywords ***
Launch Salesforce
    [Documentation]    Opens browser
    Open Browser       about:blank              chrome
    Go To              ${SFORCE_LOGIN_URL}

Login To Salesforce
    [Documentation]    Logs into Salesforce using variables
    Type Text          Username                 ${SFORCE_USERNAME}
    Type Secret        Password                 ${SFORCE_PASSWORD}
    Click Text         Log In

Navigate To Service App
    [Documentation]    Uses app launcher to navigate to Service app
    Launch App         Service
    Verify Text        Service

Navigate To Sales App
    [Documentation]    Uses app launcher to navigate to Service app
    Launch App         Sales
    Verify Text        Sales
Verify Service App Content
    [Documentation]    Verifies that Quarterly Performance and Assistant text are displayed
    Verify Text        Quarterly Performance
    Verify Text        Assistant
Go to oportunities
    [Documentation]    go to oportunities tab
    ClickText          Opportunities
    Verify Text        Opportunities

Create New oportunity
    [Documentation]    Create new opportunity from sales menu
    ClickText          New
    UseModal           On
    TypeText           *Close Date              ${future_date}
    TypeText           *Opportunity Name        ${random_name} 
    PickList           *Stage                   ${Stage}
    ComboBox           Search Accounts...       ${Account}            index=${AccountIndex}
    VerifyPickList     Lead Source              ${LeadSource}
    ClickText          Save                     partial_match=False
    UseModal           Off
