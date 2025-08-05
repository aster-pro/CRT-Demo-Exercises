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





