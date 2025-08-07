*** Settings ***
Library                QForce
Library                ../libraries/pythonLib.py
Suite Setup            Open Browser                about:blank               chrome
Suite Teardown         Close All Browsers


*** Variables ***
${GITHUB_URL}          https://github.com/login
${USERNAME}            your_username
${PASSWORD}            your_password

*** Test Cases ***
Login to GitHub and Validate User Page
    [Documentation]    Test case to login to GitHub and validate successful authentication
    ...                by verifying user-specific elements on the user page
    [Tags]             github                      login                     authentication

    Open Browser       ${GITHUB_URL}               chrome

    Verify Text        Sign in to GitHub

    Type Text          Username or email address                             ${USERNAME}
    Type Secret        Password                    ${PASSWORD}

    Click Text         Sign in

    Verify Text        Dashboard
    Verify Text        Top repositories
    ClickElement       xpath=//button[@aria-label\='Open user navigation menu']
    Verify Text        Your repositories

    Is Text            Create repository           timeout=10

    Verify Text        ${USERNAME}

    Click Text         ${USERNAME}

    Verify Text        Overview
    Verify Text        Repositories
    Verify Text        Projects
    Verify Text        Packages

    Is Text            Popular repositories        timeout=5

    [Teardown]         Close Browser

Demo Test
    [Documentation]    Demo Test

    ClickItem          Search Accounts...    tag=input           
    VerifyText         Recent Accounts
    ClickText          Recent Accounts
    ClickText          Search Accounts...
    VerifyText         New Account
    ClickText          New Account                 anchor=Recent Accounts
    UseModal           On

Using Python Library
    greetings

*** Keywords ***
Close Browser
    [Documentation]    Closes the current browser session
    Go To              about:blank
