*** Settings ***
Library    QForce
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
    
    # Navigate to app launcher
    LaunchApp          Service
    
    # Verify we are on the Services app
    Verify Text        Service       timeout=15    
    
    # Close browser
    Close Browser