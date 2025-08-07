*** Settings ***
Library                         QForce
Library                         DateTime
Library                         String

*** Variables ***
${Stage}                        Prospecting
${Account}                      Salesforce
${AccountIndex}                 1
${LeadSource}                   Web
${opportunity_name}             ${empty}
*** Keywords ***
Launch Salesforce
    [Documentation]             Opens browser
    Open Browser                about:blank                 chrome
    Go To                       ${SFORCE_LOGIN_URL}

Login To Salesforce
    [Documentation]             Logs into Salesforce using variables
    Type Text                   Username                    ${SFORCE_USERNAME}
    Type Secret                 Password                    ${SFORCE_PASSWORD}
    Click Text                  Log In

Navigate To Service App
    [Documentation]             Uses app launcher to navigate to Service app
    Launch App                  Service
    Verify Text                 Service

Navigate To Sales App
    [Documentation]             Uses app launcher to navigate to Service app
    Launch App                  Sales
    Verify Text                 Sales
Verify Service App Content
    [Documentation]             Verifies that Quarterly Performance and Assistant text are displayed
    Verify Text                 Quarterly Performance
    Verify Text                 Assistant
Go to opportunities
    [Documentation]             go to oportunities tab
    ClickText                   Opportunities
    Verify Text                 Opportunities
Create New oportunity DD
    [Documentation]             Create new opportunity from sales menu
    ClickText                   New
    UseModal                    On
    ${future_date}              Get Current Date            increment=30 days           result_format=%m/%d/%Y
    ${today_timestamp}          Get Current Date            result_format=%Y%m%d_%H%M%S
    ${opportunity_name_timestamp}                           Set Variable                ${opportunity_name}_${today_timestamp}
    TypeText                    *Close Date                 ${future_date}
    TypeText                    *Opportunity Name           ${opportunity_name_timestamp}
    PickList                    *Stage                      ${Stage}
    ComboBox                    Search Accounts...          ${Account}                  index=${AccountIndex}
    VerifyPickList              Lead Source                 ${LeadSource}
    ClickText                   Save                        partial_match=False
    UseModal                    Off

Create New oportunity
    [Documentation]             Create new opportunity from sales menu
    ClickText                   New
    UseModal                    On
    ${future_date}              Get Current Date            increment=30 days           result_format=%m/%d/%Y
    ${today_timestamp}          Get Current Date            result_format=%Y%m%d_%H%M%S
    ${opportunity_name_timestamp}                           Set Variable                ${opportunity_name}_${today_timestamp}
    TypeText                    *Close Date                 ${future_date}
    TypeText                    *Opportunity Name           ${opportunity_name_timestamp}
    PickList                    *Stage                      ${Stage}
    ComboBox                    Search Accounts...          ${Account}                  index=${AccountIndex}
    VerifyPickList              Lead Source                 ${LeadSource}
    ClickText                   Save                        partial_match=False
    UseModal                    Off

Create New Account in opportunities
    [Documentation]             Create new opportunity from sales menu
    ## create new opportunity
    ClickText                   New
    UseModal                    On
    ## create new account
    ClickElement                xpath\=//input[@placeholder\='Search Accounts...']
    Sleep                       1
    ClickText                   New Account                 anchor=Recent Accounts
    Sleep                       1
    #UseModal                   On
    ${today_timestamp}          Get Current Date            result_format=%Y%m%d_%H%M%S
    ${random_account}           Set Variable                TestAcc_${today_timestamp}
    TypeText                    *Account Name               ${random_account}           anchor=Opportunity Name
    TypeText                    Phone                       +528332226666
    TypeText                    Website                     www.google.com
    TypeText                    Description                 this is a new account for testing
    ClickElement                xpath\=//button[text()\='Save']                       index=2
    #VerifyText                  was created timeout=3
    UseModal                    Off
    #VerifyText                 was created
    UseModal                    On
    ##continuew creating the opportunity

