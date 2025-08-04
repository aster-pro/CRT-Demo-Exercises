*** Settings ***
Library                   QWeb

*** Variables ***
${GITHUB_URL}            https://github.com/login
${USERNAME}              your_username
${PASSWORD}              your_password

*** Test Cases ***
GitHub Login and Home Page Validation
    [Documentation]       Comprehensive test case for GitHub login and home page validation.
    ...                   Navigates to GitHub login page, enters credentials, validates successful login,
    ...                   and verifies user is on the correct authenticated home page.
    [Tags]                GitHub    Login    Authentication    HomePage
    Setup GitHub Login
    Enter Login Credentials
    Submit Login Form
    Validate Successful Login
    Verify Home Page Elements
    Verify User Profile Access

*** Keywords ***
Setup GitHub Login
    [Documentation]       Navigate to GitHub login page and verify page elements
    Open Browser          ${GITHUB_URL}                chrome
    Verify Text           Sign in to GitHub
    Verify Text           Username or email address
    Verify Text           Password

Enter Login Credentials
    [Documentation]       Enter username and password in login form
    Type Text             Username or email address    ${USERNAME}
    Type Secret           Password                     ${PASSWORD}

Submit Login Form
    [Documentation]       Click the sign in button to submit login form
    Click Text            Sign in

Validate Successful Login
    [Documentation]       Verify successful login by checking for authenticated page elements
    Verify Text           Dashboard                    timeout=15
    Verify Text           Repositories
    Verify Text           Pull requests

Verify Home Page Elements
    [Documentation]       Validate key elements present on GitHub home page after login
    Verify Text           Recent activity
    Verify Text           All activity
    Verify Text           Explore repositories
    Verify Text           Create repository

Verify User Profile Access
    [Documentation]       Verify user can access profile menu and settings
    Click Text            View profile and more
    Verify Text           Your profile
    Verify Text           Your repositories
    Verify Text           Settings
    Click Text            Dashboard
