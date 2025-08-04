*** Settings ***
Library           QWeb

*** Variables ***
${GITHUB_USERNAME}    your_username_here
${GITHUB_PASSWORD}    your_password_here

*** Test Cases ***
Login To GitHub And Validate Success
    [Documentation]    Test to login to GitHub and validate successful authentication
    [Tags]             github    login    authentication
    Setup Browser
    Navigate To GitHub Login
    Enter Login Credentials
    Submit Login Form
    Validate Successful Login
    [Teardown]    Close Browser

*** Keywords ***
Setup Browser
    [Documentation]    Initialize browser and navigate to GitHub
    Open Browser          https://github.com    chrome
    SetConfig             DefaultTimeout        30s

Navigate To GitHub Login
    [Documentation]    Navigate to GitHub login page
    Go To                 https://github.com/login
    Verify Text           Sign in to GitHub

Enter Login Credentials
    [Documentation]    Enter username and password credentials
    Type Text             Username or email address    ${GITHUB_USERNAME}
    Type Secret           Password                     ${GITHUB_PASSWORD}

Submit Login Form
    [Documentation]    Click the sign in button to submit login form
    Click Text            Sign in

Validate Successful Login
    [Documentation]    Verify that login was successful by checking for user elements
    Verify Text           Dashboard                    timeout=15s
    Verify Text           Create repository
    ${profile_visible}=   Is Text    View profile and more    timeout=10s
    Should Be True        ${profile_visible}           Profile menu should be visible after login
