*** Settings ***
Library    QForce
Suite Setup    Go To    about:blank


*** Test Cases ***
Login To Salesforce Sandbox
    [Documentation]    Test case to login to Salesforce sandbox using Chrome browser
    [Tags]             salesforce    login    sandbox
    
    # Open Chrome browser and navigate to Salesforce
    Go to    ${login_url}
    
    # Enter login credentials
    Type Text          Username             ${username}
    Type Secret        Password             ${password}
    
    # Click login button
    Click Text         Log In to Sandbox
    
    # Verify successful login by checking for common Salesforce elements
    Verify Text        Home
    Verify Text        Setup
