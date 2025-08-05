*** Settings ***
Library    QForce
Suite Setup        OpenBrowser    about:blank    chrome

*** Variables ***
${SALESFORCE_URL}    https://login.salesforce.com
${USERNAME}          your_username
${PASSWORD}          your_password
${BROWSER}           chrome

*** Test Cases ***
Salesforce Service Page Validation Test
    [Documentation]    Test case to login to Salesforce and validate Service page
    [Tags]             salesforce    service    login
    
    # Open browser and navigate to Salesforce
    Open Browser       ${SALESFORCE_URL}    ${BROWSER}
    
    # Handle login process
    Type Text          Username             ${USERNAME}
    Type Secret        Password             ${PASSWORD}
    Click Text         Log In
    
    # Wait for successful login and verify we're in Salesforce
    Verify Text        Home                 timeout=30
    
    # Navigate to Service app
    Launch App         Service
    
    # Verify Service page loaded correctly
    Verify Text        Service              timeout=20
    Verify Text        Cases                timeout=10
    Verify Text        Accounts             timeout=10
    
    # Additional validation for Service page elements
    Verify Text        Recent Items
    Verify Text        Quick Actions
    
    # Log successful completion
    Log                Service page validation completed successfully
