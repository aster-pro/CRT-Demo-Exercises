*** Settings ***
Library                    QForce
Library                    DateTime
Resource                   ../resources/salesforce_common.resource
Suite Setup                OpenBrowser                 about:blank            chrome

*** Variables ***
${BROWSER}                 chrome


*** Test Cases ***
Salesforce Service Page Validation Test
    [Documentation]        Test case to login to Salesforce and validate Service page
    [Tags]                 salesforce                  service                login

    # Navigate to the page URL
    GoTo                   ${URL}

    # Login to Salesforce
    Login To Salesforce

    # Navigate to Sales app
    Launch App             Sales
    Verify Text            Sales                       timeout=20


*** Keywords ***
Create Opportunity From Excel Data
    [Documentation]        Template keyword to create opportunity with Excel data
    [Arguments]            ${opportunity_name}    ${account_name}    ${opportunity_type}    ${stage}    ${close_date_offset}    ${amount}    ${probability}    ${description}
    
    ${current_timestamp}=  Get Current Date
    ${close_date}=         Generate Futu

    
    # Navigate to Sales app
    Launch App             Sales
    Verify Text            Sales                       timeout=20
    
    # Navigate to Opportunities tab
    Click Text             Opportunities
    Verify Text            Opportunities               timeout=15
    
    # Open New Opportunity creation window
    Click Text             New
    Use Modal              On
    Verify Text            New Opportunity             timeout=10
    
    # Fill all opportunity fields with Excel data
    Type Text              *Opportunity Name           ${opportunity_name}
    Type Text              Search Accounts...          ${account_name}
    Click Text             ${account_name}
    Pick List              Type                        ${opportunity_type}
    
    # Set close date based on offset from Excel
    Click Text             Select a date for Close Date
    ${target_date}=        Add Time To Date           ${current_timestamp}    ${close_date_offset} days
    ${day}=                Convert Date               ${target_date}          result_format=%d
    ${day_number}=         Convert To Integer         ${day}
    Click Text             ${day_number}
    
    Pick List              *Stage                      ${stage}
    
    # Fill additional fields from Excel data
    Type Text    Amount    ${amount}
    Type Text    Probability (%)    ${probability}
    Type Text    Description    ${description}
    
    Click Text             Save & New
    Use Modal              Off
    
    # Verify opportunity was created successfully
    Verify Text            ${opportunity_name}    timeout=10
    
    # Log successful completion with all data
