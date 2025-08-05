*** Settings ***
Library                QForce
Library                QWeb
Resource               ../resources/salesforceCommon.resource
Suite Setup            OpenBrowser                 about:blank    chrome

*** Variables ***        


*** Test Cases ***
Salesforce Service App Authentication and Validation
    [Documentation]    Comprehensive test case that authenticates to Salesforce, navigates to Service app,
    ...                validates quarterly performance text, and verifies user profile information

    # Step 1: Open browser and navigate to Salesforce
    Open Browser       ${login_url}                chrome

    # Step 2: Authenticate to Salesforce
    Type Text          Username                    ${username}
    Type Secret        Password                    ${password}
    Click Text         Log In

    # Step 3: Verify successful login
    Verify Text        Home

    # Step 4: Navigate to Service app
    Launch App         Service

    # Step 5: Validate quarterly performance text
    Verify Text        Quarterly Performance

    # Step 6: Access user profile
    Click Text         View profile

    # Step 7: Validate username in profile
    Verify Text        Tester Aster

    # Step 8: Close profile if modal
    Click Text         View profile

Create Opportunity in Salesforce
    [Documentation]    Test case that authenticates to Salesforce, navigates to Sales app,
    ...                creates a new opportunity with test data, and verifies successful creation
    [Tags]             opportunity    sales    create

    # Step 1: Open browser and navigate to Salesforce
    Open Browser       ${login_url}                chrome

    # Step 2: Authenticate to Salesforce
    Type Text          Username                    ${username}
    Type Secret        Password                    ${password}
    Click Text         Log In

    # Step 3: Verify successful login
    Verify Text        Home

    # Step 4: Navigate to Sales app
    Launch App         Sales

    # Step 5: Navigate to Opportunities
    Click Text         Opportunities

    # Step 6: Click New button to create opportunity
    Click Text         New

    # Step 7: Fill in opportunity details
    Type Text          Opportunity Name            Test Opportunity Q2 2025
    Type Text          Account Name                Acme
    ComboBox           Search Accounts...          Acme
    Pick List          Stage                       Prospecting
    Pick List          Type                        New Business
    Type Text          Amount                      50000
    Type Text          Close Date                  12/31/2025
    Pick List          Lead Source                 Web
    Type Text          Description                 Test opportunity created via automation

    # Step 8: Save the opportunity
    Click Text         Save
    
    # Close Modal Window
    ClickText          Cancel and close

    # Step 9: Verify opportunity was created successfully
    Verify Text   Test Opportunity Q2 2025
    VerifyText    $50,000.00
    VerifyText    Acme

   




