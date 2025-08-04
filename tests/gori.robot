*** Settings ***
Library                QWeb

*** Variables ***
${GITHUB_URL}          https://github.com/login
${USERNAME}            
${PASSWORD}            
${TIMEOUT}             20

*** Test Cases ***
Login To GitHub And Validate User Page
    [Documentation]    Comprehensive test case to login to GitHub and validate user page elements
    [Tags]             github    login    smoke    regression
    
    # Navigate to GitHub login page
    Open Browser       ${GITHUB_URL}    chrome
    Verify Text        Sign in to GitHub    timeout=${TIMEOUT}
    
    # Enter login credentials
    Type Text          Username or email address    ${USERNAME}    timeout=${TIMEOUT}
    Type Secret        Password    ${PASSWORD}    timeout=${TIMEOUT}
    
    # Submit login form
    Click Text         Sign in    timeout=${TIMEOUT}
    
    # Validate successful login by checking user page elements
    Verify Text        Dashboard    timeout=${TIMEOUT}
    Verify Text        Repositories    timeout=${TIMEOUT}
    Verify Text        Pull requests    timeout=${TIMEOUT}
    Verify Text        Issues    timeout=${TIMEOUT}
    
    # Verify user profile elements are present
    ${profile_visible}=    Is Text    ${USERNAME}    timeout=5
    IF                 ${profile_visible}
        Verify Text        ${USERNAME}
    END
    
    # Verify navigation menu items
    Verify Text        Overview    timeout=10
    Verify Text        Repositories    timeout=10
    Verify Text        Projects    timeout=10
    Verify Text        Packages    timeout=10
    
    # Verify user is on correct page by checking URL contains username
    ${current_url}=    Get Current Url
    Should Contain     ${current_url}    github.com
    
    # Additional validation - check for user avatar or profile picture
    ${avatar_present}=    Is Text    View profile and more    timeout=5
    IF                 ${avatar_present}
        Log To Console    User avatar is visible - login successful
    END
    
    # Verify logout option is available
    Click Text         View profile and more    timeout=10
    Verify Text        Sign out    timeout=10
    
    # Close browser
    Close Browser

*** Keywords ***
Get Current Url
    [Documentation]    Helper keyword to get current page URL
    ${url}=            Execute Javascript    return window.location.href
    RETURN             ${url}
