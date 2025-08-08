*** Settings ***
Library                   QForce

*** Keywords ***
Login
    [Documentation]       Ensure user is logged into Salesforce
    GoTo                  ${URL}
    ${is_logged_in}=      Run Keyword And Return Status                VerifyText            Setup    timeout=3
    Run Keyword If        ${is_logged_in}             Perform Login
Perform Login
    TypeText              Username                    ${USERNAME}
    TypeSecret            Password                    ${PASSWORD}
    ClickText             Log In
Close Browser
    [Documentation]       Closes the current browser session
    Close All Browsers