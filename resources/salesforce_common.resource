*** Settings ***
Library    QForce


*** Keywords ***
Login To Salesforce
    [Documentation]    Handles Salesforce login process
    
    Open Browser       ${URL}    chrome
    Type Text          Username             ${USERNAME}
    Type Secret        Password             ${PASSWORD}
    Click Text         Log In
    Verify Text        Home                 timeout=30