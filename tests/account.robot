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
    ${close_date}=            Set Variable                01/01/2025

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

    TypeText                  *Opportunity Name           ${opp_name}


    PickList                  Type                        Existing Business
    TypeText                  *Close Date                 ${close_date}
    PickList                  *Stage                      Needs Analysis

    UseModal                  On

    TypeText                  *Account Name               ${gen_username}             anchor=Opportunity Name
    ClickText                 Save

    UseModal                  Off

    ClickText                 Save & New


    # Log successful completion without creating the opportunity
    Log                       New Opportunity form opened successfully - ready for data entry
