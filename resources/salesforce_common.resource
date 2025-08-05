*** Settings ***
Library    QForce


*** Keywords ***
Login To Salesforce
    [Documentation]    Handles Salesforce login process
    
    Type Text          Username             ${USERNAME}
    Type Secret        Password             ${PASSWORD}
    Click Text         Log In
    Verify Text        Home                 timeout=30