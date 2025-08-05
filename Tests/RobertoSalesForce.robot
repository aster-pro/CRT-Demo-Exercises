*** Settings ***
Library          QForce

*** Variables ***
${BROWSER}       chrome
${USERNAME}      ${EMPTY}
${PASSWORD}      ${EMPTY}
${SF_URL}        https://velocity-page-1863.scratch.my.salesforce.com/

*** Test Cases ***
Login To Salesforce And Access Bolt Solutions App
    [Documentation]    Test case to login to Salesforce and verify access to Bolt Solutions app
    [Tags]             salesforce    login    bolt-solutions
    Setup Browser
    Login To Salesforce
    Access Bolt Solutions App
    Verify Bolt Solutions App Access

*** Keywords ***
Setup Browser
    [Documentation]    Initialize browser with proper configuration
    Open Browser       about:blank    ${BROWSER}
    Go To              ${SF_URL}

Login To Salesforce
    [Documentation]    Perform login to Salesforce using credentials
    Type Text          Username       ${USERNAME}
    Type Secret        Password       ${PASSWORD}
    Click Text         Log In
    Verify Text        Home

Access Bolt Solutions App
    [Documentation]    Navigate to and launch Bolt Solutions app
    Launch App         Bolt Solutions

Verify Bolt Solutions App Access
    [Documentation]    Validate that user has successfully accessed Bolt Solutions app
    Verify Text        Bolt Solutions
    ${app_loaded}=     Is Text        Get started with Lightning Bolt Solutions
    IF                 ${app_loaded}
        Verify Text    Get started with Lightning Bolt Solutions
    ELSE
        Verify Text    Bolt Solutions
    END
