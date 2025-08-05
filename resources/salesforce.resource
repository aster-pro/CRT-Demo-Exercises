*** Settings ***
Library                QForce    

*** Variables ***

*** Keywords ***
Launch Salesforce
    [Documentation]    Opens browser
    Open Browser    about:blank    chrome
    Go To    ${SFORCE_LOGIN_URL}

Login To Salesforce
    [Documentation]    Logs into Salesforce using variables
    Type Text    Username    ${SFORCE_USERNAME}
    Type Secret    Password    ${SFORCE_PASSWORD}
    Click Text    Log In

Navigate To Service App
    [Documentation]    Uses app launcher to navigate to Service app
    Launch App    Service
    Verify Text    Service

Verify Service App Content
    [Documentation]    Verifies that Quarterly Performance and Assistant text are displayed
    Verify Text    Quarterly Performance
    Verify Text    Assistant
