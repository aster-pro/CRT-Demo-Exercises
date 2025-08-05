*** Settings ***
Library     QForce

*** Keywords ***
Log In
    [Documentation]    Log in 
    Type Text          Username        ${USERNAME}
    Type Secret        Password        ${PASSWORD}
    Click Text         Log In
Close Browser
    [Documentation]    Closes the current browser session
    Close All Browsers