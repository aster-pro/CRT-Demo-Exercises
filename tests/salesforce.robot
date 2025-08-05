*** Settings ***
Library    QForce
Resource    ../resources/salesforce_common.resource
Suite Setup        OpenBrowser    about:blank    chrome

*** Variables ***
${BROWSER}           chrome


*** Test Cases ***
Salesforce Service Page Validation Test
    [Documentation]    Test case to login to Salesforce and validate Service page
    [Tags]             salesforce    service    login

    # Navigate to the page URL
    GoTo               ${URL}
    
    # Login to Salesforce
    Login To Salesforce
    
    # Navigate to Service app
    Launch App         Service
    
    # Verify Service page loaded correctly
    Verify Text        Service              timeout=20
    Verify Text        Cases                timeout=10
    Verify Text        Accounts             timeout=10
    
    # Additional validation for Service page elements
    Verify Text        Quarterly Performance
    Verify Text        Today's Events
    Verify Text        Today's Tasks
    Verify Text        Today's Assistant


    
    # Log successful completion
    Log                Service page validation completed successfully
