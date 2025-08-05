*** Settings ***
Library    QForce

*** Variables ***
${login_url}        https://login.salesforce.com
${username}         ${USERNAME}
${password}         ${PASSWORD}

*** Test Cases ***
Salesforce Login And Navigate To Services App
    [Documentation]    Test case to login to Salesforce, verify successful login, 
    ...                navigate to app launcher, open Services app and verify navigation
    [Tags]             salesforce    login    services    smoke
    
    # Open browser and navigate to Salesforce login page
    Open Browser       ${login_url}    chrome
    
    # Perform login with credentials
    Type Text          Username        ${username}
    Type Secret        Password        ${password}
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