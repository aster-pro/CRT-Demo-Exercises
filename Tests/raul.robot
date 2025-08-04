*** Settings ***
Library           QWeb
Documentation     Test suite for GitHub login and home page validation
Suite Setup       Open Browser    https://github.com/login    chrome
Suite Teardown    Close Browser

*** Variables ***
${GITHUB_USERNAME}    your_username_here
${GITHUB_PASSWORD}    your_password_here
${LOGIN_URL}          https://github.com/login
${TIMEOUT}            30

*** Test Cases ***
Login to GitHub and Validate Home Page
    [Documentation]    Comprehensive test case to login to GitHub and validate the home page elements
    [Tags]             login    github    smoke
    
    # Navigate to GitHub login page
    Go To              ${LOGIN_URL}
    Verify Text        Sign in to GitHub    timeout=${TIMEOUT}
    
    # Enter login credentials
    Type Text          Username or email address    ${GITHUB_USERNAME}    timeout=${TIMEOUT}
    Type Secret        Password                     ${GITHUB_PASSWORD}    timeout=${TIMEOUT}
    
    # Submit login form
    Click Text         Sign in    timeout=${TIMEOUT}
    
    # Validate successful login by checking home page elements
    Verify Text        Dashboard    timeout=${TIMEOUT}
    Verify Text        Repositories    timeout=${TIMEOUT}
    
    # Verify user profile elements are present
    ${profile_visible}=    Is Text    View profile and more    timeout=10
    Should Be True     ${profile_visible}    Profile menu should be visible after login
    
    # Verify navigation elements
    Verify Text        Pull requests    timeout=${TIMEOUT}
    Verify Text        Issues          timeout=${TIMEOUT}
    Verify Text        Marketplace     timeout=${TIMEOUT}
    Verify Text        Explore         timeout=${TIMEOUT}
    
    # Verify repository section
    ${repo_section}=   Is Text    Recent Repositories    timeout=10
    Run Keyword If     ${repo_section}    Log    Recent Repositories section found
    
    # Verify feed section exists
    ${feed_visible}=   Is Text    Following    timeout=5
    Run Keyword If     ${feed_visible}    Verify Text    All activity
    
    # Additional validation for logged-in state
    ${create_repo}=    Is Text    Create repository    timeout=5
    Should Be True     ${create_repo}    Create repository option should be available
    
    # Log successful completion
    Log                GitHub login and home page validation completed successfully

*** Keywords ***
Should Be True
    [Documentation]    Custom keyword to validate boolean conditions
    [Arguments]        ${condition}    ${error_message}
    Run Keyword If     not ${condition}    Fail    ${error_message}
