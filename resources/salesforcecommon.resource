*** Settings ***

Library    QForce

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
    Verify Text        Seller Home

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

Logout From Salesforce
    [Documentation]             Logout from Salesforce
    Click Element               xpath://button[@aria-haspopup\='true' and contains(@class,'branding-userProfile-button')]
    Click Text                  Log Out
    Verify Text                 Username