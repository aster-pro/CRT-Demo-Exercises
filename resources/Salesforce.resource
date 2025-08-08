*** Settings ***
Library                   QForce

*** Keywords ***
Login
    [Documentation]       Ensure user is logged into Salesforce
    ${is_logged_in}=      Run Keyword And Return Status                VerifyText             Log In    timeout=3
    Run Keyword If        ${is_logged_in}             Perform Login
Perform Login
    GoTo                  ${URL}
    TypeText              Username                    ${USERNAME}
    TypeSecret            Password                    ${PASSWORD}
    ClickText             Log In
Close Browser
    [Documentation]       Closes the current browser session
    Close All Browsers