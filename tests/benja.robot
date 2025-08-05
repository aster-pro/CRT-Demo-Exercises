*** Settings ***
Library                QWeb
Documentation          GitHub Login Test Suite - Validates user authentication and credential handling

*** Variables ***
${GITHUB_URL}          https://github.com/login
${USERNAME}            your_username
${PASSWORD}            your_password
${INVALID_USERNAME}    invalid_user
${INVALID_PASSWORD}    invalid_pass

*** Test Cases ***
Valid GitHub Login
    [Documentation]    Test successful login to GitHub with valid credentials
    [Tags]            login    positive    smoke
    Setup Browser
    Navigate To GitHub Login
    Enter Valid Credentials
    Submit Login Form
    Verify Successful Login
    Logout From GitHub

Invalid Username Login
    [Documentation]    Test login failure with invalid username
    [Tags]            login    negative    validation
    Setup Browser
    Navigate To GitHub Login
    Enter Invalid Username
    Submit Login Form
    Verify Login Error Message

Invalid Password Login
    [Documentation]    Test login failure with invalid password
    [Tags]            login    negative    validation
    Setup Browser
    Navigate To GitHub Login
    Enter Invalid Password
    Submit Login Form
    Verify Login Error Message

Empty Credentials Login
    [Documentation]    Test login failure with empty credentials
    [Tags]            login    negative    validation
    Setup Browser
    Navigate To GitHub Login
    Submit Login Form
    Verify Required Field Validation

*** Keywords ***
Setup Browser
    [Documentation]    Initialize browser and configure settings
    Open Browser          about:blank    chrome
    Go To                 ${GITHUB_URL}

Navigate To GitHub Login
    [Documentation]    Navigate to GitHub login page and verify page elements
    Verify Text           Sign in to GitHub
    Verify Text           Username or email address
    Verify Text           Password

Enter Valid Credentials
    [Documentation]    Enter valid username and password
    Type Text             Username or email address    ${USERNAME}
    Type Secret           Password                     ${PASSWORD}

Enter Invalid Username
    [Documentation]    Enter invalid username with valid password
    Type Text             Username or email address    ${INVALID_USERNAME}
    Type Secret           Password                     ${PASSWORD}

Enter Invalid Password
    [Documentation]    Enter valid username with invalid password
    Type Text             Username or email address    ${USERNAME}
    Type Secret           Password                     ${INVALID_PASSWORD}

Submit Login Form
    [Documentation]    Click the sign in button to submit login form
    Click Text            Sign in

Verify Successful Login
    [Documentation]    Verify successful login by checking user dashboard elements
    Verify Text           Dashboard
    Verify Text           Create repository
    Verify Text           Your repositories

Verify Login Error Message
    [Documentation]    Verify error message appears for invalid credentials
    Verify Text           Incorrect username or password

Verify Required Field Validation
    [Documentation]    Verify validation messages for empty required fields
    Verify Text           Username or email address

Logout From GitHub
    [Documentation]    Logout from GitHub account
    Click Text            View profile and more
    Click Text            Sign out
    Verify Text           Sign in to GitHub
