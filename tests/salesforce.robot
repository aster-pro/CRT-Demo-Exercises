*** Settings ***
Library           QForce
Library           QWeb
Suite Setup       OpenBrowser    about:blank    chrome

*** Variables ***
${login_url}      https://velocity-page-1863.scratch.my.salesforce.com/
${username}       hello@aster.pro
${password}       Welcome@123


*** Test Cases ***
Salesforce Service App Authentication and Validation
    [Documentation]    Comprehensive test case that authenticates to Salesforce, navigates to Service app,
    ...                validates quarterly performance text, and verifies user profile information
    
    # Step 1: Open browser and navigate to Salesforce
    Open Browser      ${login_url}    chrome
    
    # Step 2: Authenticate to Salesforce
    Type Text         Username        ${username}
    Type Secret       Password        ${password}
    Click Text        Log In
    

    # Step 4: Verify successful login
    Verify Text       Home
    
    # Step 5: Navigate to Service app
    Launch App        Service
    
    # Step 6: Validate quarterly performance text
    Verify Text       Quarterly Performance
    
    # Step 7: Access user profile
    Click Text        View profile
    
    # Step 8: Validate username in profile
    Verify Text       Tester Aster
    
    # Step 9: Close profile if modal
     Click Text        View profile
    
    # Step 10: Verify we're back in Service app


*** Keywords ***
Handle MFA Authentication
    [Documentation]    Helper keyword to handle Multi-Factor Authentication
    ${mfa_displayed}= Is Text    Verify Your Identity    timeout=5
    IF                ${mfa_displayed}
        Type Secret   Enter the code from your authenticator app    ${secret}
        Click Text    Verify
        Verify Text   Home    timeout=30
    END
