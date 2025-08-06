*** Settings ***
Library                       QForce
Library                       DateTime
Resource                      ../resources/salesforce_common.resource
Suite Setup                   OpenBrowser                 about:blank                 chrome

*** Variables ***
${BROWSER}                    chrome


*** Test Cases ***
Salesforce Sales New Account Test

    ${current_timestamp} =    Get Current Date
    ${gen_username}=          Set Variable                user_${current_timestamp}
    ${opp_name}=              Set Variable                YairOpp_${current_timestamp}

    # Navigate to the page URL
    GoTo                      ${URL}

    # Login to Salesforce
    Login To Salesforce

    # Navigate to Sales app
    Launch App                Sales
    Verify Text               Sales                       timeout=20

    # Navigate to Opportunities tab
    Click Text                Opportunities
    Verify Text               Opportunities               timeout=15

    # Open New Opportunity creation window
    Click Text                New

    Click Text                *Account Name
    Sleep                     2s
    ClickText                 New Account
    
    UseModal                  On

    TypeText                  *Account Name               ${gen_username}                anchor=Opportunity Name
    ClickText                 Save

    UseModal                  Off

    TypeText                  *Opportunity Name          ${opp_name}
    

    PickList    Type    Existing Business
    ClickText    Select a date for Close Date
    ClickText    5
    PickList    *Stage    Needs Analysis


    # Log successful completion without creating the opportunity
    Log                       New Opportunity form opened successfully - ready for data entry
