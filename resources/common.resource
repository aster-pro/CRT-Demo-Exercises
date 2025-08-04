*** Settings ***
Library                Collections
Library                QWeb

*** Variables ***

*** Keywords ***
Get Field Value From Json
    [Documentation]    The value of json argument expected to be one dictionary
    [Arguments]        ${json}                     ${field_name}
    ${object} =        Evaluate                    json.loads("""${json}""")
    Log                ${object}
    ${fieldValue} =    Get From Dictionary         ${object}                   ${field_name}
    RETURN             ${fieldValue}

Setup Browser
    [Documentation]    Initialize browser and navigate to GitHub
    Open Browser       https://github.com          chrome
    SetConfig          DefaultTimeout              30s

Navigate To GitHub Login
    [Documentation]    Navigate to GitHub login page
    Go To              https://github.com/login
    Verify Text        Sign in to GitHub

Enter Login Credentials
    [Documentation]    Enter username and password credentials
    Type Text          Username or email address                               ${GITHUB_USERNAME}
    Type Secret        Password                    ${GITHUB_PASSWORD}

Submit Login Form
    [Documentation]    Click the sign in button to submit login form
    Click Text         Sign in

Validate Successful Login
    [Documentation]    Verify that login was successful by checking for user elements
    Verify Text        Dashboard                   timeout=15s
    Verify Text        Create repository