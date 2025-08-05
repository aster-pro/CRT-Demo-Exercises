*** Settings ***
Library    QForce

*** Variables ***
${SALESFORCE_URL}    https://velocity-page-1863.scratch.my.salesforce.com/    chrome
${USERNAME}          hello@aster.pro
${PASSWORD}          Welcome@123

*** Test Cases ***
Login To Salesforce Sandbox
    [Documentation]    Test case to login to Salesforce sandbox using Chrome browser
    [Tags]             salesforce    login    sandbox
    
    # Open Chrome browser and navigate to Salesforce
    Open Browser       ${SALESFORCE_URL}    chrome
    
    # Enter login credentials
    Type Text          Username             ${USERNAME}
    Type Secret        Password             ${PASSWORD}
    
    # Click login button
    Click Text         Log In to Sandbox
    
    # Verify successful login by checking for common Salesforce elements
    Verify Text        Home
    Verify Text        Setup
