*** Settings ***
Library                         QWeb
Resource                        ../resources/common.resource
Suite Setup                     OpenBrowser                 about:blank    chrome

*** Variables ***
${GITHUB_USERNAME}              your_username_here
${GITHUB_PASSWORD}              your_password_here

*** Test Cases ***
Login To GitHub And Validate Success
    [Documentation]             Test to login to GitHub and validate successful authentication
    [Tags]                      github                      login          authentication
    Setup Browser
    Navigate To GitHub Login
    Enter Login Credentials
    Submit Login Form
    Validate Successful Login
    [Teardown]                  Close Browser

*** Keywords ***


