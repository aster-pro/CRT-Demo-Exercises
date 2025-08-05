*** Settings ***

Library                     QForce

*** Keywords ***
Setup Browser
    [Documentation]         Initialize browser with proper configuration
    Open Browser            about:blank                 ${BROWSER}
    Go To                   ${SF_URL}

Login To Salesforce
    [Documentation]         Perform login to Salesforce using credentials
    Type Text               Username                    ${USERNAME}
    Type Secret             Password                    ${PASSWORD}
    Click Text              Log In
    Verify Text             Seller Home

Access Bolt Solutions App
    [Documentation]         Navigate to and launch Bolt Solutions app
    Launch App              Bolt Solutions

Access Sales App
    [Documentation]         Navigate to and access Sales app
    Launch App              Sales
    Verify Text             Sales

Verify Bolt Solutions App Access
    [Documentation]         Validate that user has successfully accessed Bolt Solutions app
    Verify Text             Bolt Solutions
    ${app_loaded}=          Is Text                     Get started with Lightning Bolt Solutions
    IF                      ${app_loaded}
        Verify Text         Get started with Lightning Bolt Solutions
    ELSE
        Verify Text         Bolt Solutions
    END

Logout From Salesforce
    [Documentation]         Logout from Salesforce
    ClickText               View profile
    Click Text              Log Out
    Verify Text             Username

Create New Opportunity
    [Documentation]         Create a new opportunity with Roberto plus timestamp
    Click Text              Opportunities
    Verify Text             Opportunities
    Click Text              New
    Verify Text             New Opportunity
    Type Text               Opportunity Name            Roberto2
    Type Text               Account Name                Salesforce
    Pick List               Stage                       Prospecting
    Type Text               Close Date                  12/31/2025
    Click Text              Save
    Verify Text             Roberto1
    Verify Text             was created