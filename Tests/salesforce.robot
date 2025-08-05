*** Settings ***
Library    QForce
Suite Setup        OpenBrowser    about:blank    chrome

*** Variables ***
${SFORCE_LOGIN_URL}          https://login.salesforce.com
${SFORCE_USERNAME}           ${EMPTY}
${SFORCE_PASSWORD}           ${EMPTY}

*** Test Cases ***
Verify Service App Content
    [Documentation]    Login to Salesforce, navigate to Service app and verify Quarterly Performance and Assistant text are displayed
    [Tags]             Salesforce
    Launch Salesforce
    Login To Salesforce
    Navigate To Service App
    Verify Service App Content

