*** Settings ***
Library    QForce

*** Variables ***
${SFORCE_LOGIN_URL}          https://login.salesforce.com
${SFORCE_USERNAME}           ${EMPTY}
${SFORCE_PASSWORD}           ${EMPTY}

*** Test Cases ***
Verify Service App Content
    [Documentation]    Login to Salesforce, navigate to Service app and verify Quarterly Performance and Assistant text are displayed
    [Tags]             Salesforce
    Login To Salesforce
    Navigate To Service App
    Verify Service App Content

*** Keywords ***
Login To Salesforce
    [Documentation]    Opens browser and logs into Salesforce using variables
    [Tags]             Salesforce
    Open Browser    about:blank    chrome
    Go To    ${SFORCE_LOGIN_URL}
    Type Text    Username    ${SFORCE_USERNAME}
    Type Secret    Password    ${SFORCE_PASSWORD}
    Click Text    Log In

Navigate To Service App
    [Documentation]    Uses app launcher to navigate to Service app
    [Tags]             Salesforce
    Launch App    Service
    Verify Text    Service

Verify Service App Content
    [Documentation]    Verifies that Quarterly Performance and Assistant text are displayed
    [Tags]             Salesforce
    Verify Text    Quarterly Performance
    Verify Text    Assistant
