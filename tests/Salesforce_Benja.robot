*** Settings ***
Library    QForce
Suite Setup    Open Browser    about:blank    chrome

*** Variables ***
${URL}    https://velocity-page-1863.scratch.my.salesforce.com/
${USERNAME}         
${PASSWORD}        

*** Test Cases ***
Salesforce Login And Navigate To Services App
    [Documentation]    Test case to login to Salesforce, verify successful login, 
    ...                navigate to app launcher, open Services app and verify navigation
    [Tags]             salesforce    login    services    smoke  
    
    OpenBrowser        ${URL}        chrome

    # Perform login with credentials
    Type Text          Username        ${USERNAME}
    Type Secret        Password        ${PASSWORD}
    Click Text         Log In
    
    # Verify successful login by checking for home page elements
    Verify Text        Home            timeout=30
    Verify Text        Setup
    
    # Navigate to app launcher
    Click Text         App Launcher
    
    # Search and click on Services app
    Type Text          Search apps and items...    Services
    Click Text         Services
    
    # Verify we are on the Services app
    Verify Text        Services        timeout=15
    Verify Text        Cases
    Verify Text        Work Orders
    
    # Close browser
    Close Browser

*** Keywords ***
Close Browser
    [Documentation]    Closes the current browser session
    Close All Browsers