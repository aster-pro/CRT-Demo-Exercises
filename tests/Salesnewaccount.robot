*** Settings ***
Library    QForce
Library    DateTime
Resource    ../resources/Salesforce.resource
Suite Setup    Open Browser    about:blank    chrome


*** Test Cases ***
Salesforce Login And Navigate To Services App
    [Documentation]    Test case to login to Salesforce, verify successful login, 
    ...                navigate to app launcher, open Services app and verify navigation
    [Tags]             salesforce    login    services    smoke  
    
    # Go to the log in page
    GoTo               ${URL}
    
    # Perform login with credentials
    Log In
    
    # Navigate to app launcher and click Sales
    LaunchApp          Sales
    
    # Verify we are on the Sales app
    Verify Text        Sales       timeout=15    

    #Click opportunities
    Click Text         Opportunities
    
    #Get a timestamp
    ${current_timestamp}=   Get Current Date

    #Create a new Oportunnity
    ClickText    New
    UseModal     On
    TypeText    *Close Date    12/31/2024
    TypeText    *Opportunity Name    ${current_timestamp}benja
    PickList    *Stage    Needs Analysis
    ComboBox    Search Accounts...    Salesforce    index=1
    PickList    Type    New Business
    TypeText    Amount    1000000
    PickList    Lead Source    Public Relations
    TypeText    Next Step    test
    TypeText    Description    oportunities test
    ClickText    Save    partial_match=False
    UseModal    Off
    
    # Close browser
    Close Browser