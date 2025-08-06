*** Settings ***

Library                     QForce
Library                     DateTime

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
    ${current_date}=        Get Current Date            result_format=%Y%m%d_%H%M%S
    ${opportunity_name}=    Set Variable                Roberto${current_date}
    Set Suite Variable      ${opportunity_name}

    Type Text               Opportunity Name            ${opportunity_name}
    ComboBox                Search Accounts...          Salesforce                  index=1
    Pick List               Stage                       Prospecting
    Type Text               Close Date                  12/31/2025
    Click Text              Save
    Verify Text             Opportunity "${opportunity_name}" was created.
    Log To Console          ${opportunity_name}
    LogScreenshot
    ClickText               Cancel and close

Validate Probability
    [Documentation]         Validate the probability is 10%
    Click Text              Opportunities
    Log To Console          ${opportunity_name}
    ClickText               ${opportunity_name}
    ClickText               Details
    Verify Text             10%
    Verify Text             ${opportunity_name}


Create New Opportunity With New Account Name
    [Documentation]         Create a new opportunity with new account
    Click Text              Opportunities
    Verify Text             Opportunities
    Click Text              New
    Verify Text             New Opportunity
    ${current_date}=        Get Current Date            result_format=%Y%m%d_%H%M%S
    ${opportunity_name}=    Set Variable                Roberto${current_date}
    Set Suite Variable      ${opportunity_name}
    #ClickText              Search Accounts...
    #ComboBox                Search Accounts...          New Account
    Click Text               New Account                 anchor=Recent Accounts
    Type Text               Account Name                Robert
    TypeText                Phone                       8442809070
    TypeText                Website                     www.testnow.com
    Click Text              Save
    Type Text               Opportunity Name            ${opportunity_name}
    Pick List               Stage                       Prospecting
    Type Text               Close Date                  12/31/2025
    Click Text              Save
    Verify Text             Opportunity "${opportunity_name}" was created.
    Log To Console          ${opportunity_name}
    LogScreenshot
    #Sleep                  3s
    ClickText               Cancel and close            timeout=3


    VerifyText              New Account
    Type Text               Search Accounts...          New Account

    ClickText               New Account                 anchor=Recent Accounts
    UseModal                On








