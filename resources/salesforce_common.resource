*** Settings ***
Library    QForce
Library    DateTime
Library    String


*** Keywords ***
Login To Salesforce
    [Documentation]    Handles Salesforce login process
    
    Type Text          Username             ${USERNAME}
    Type Secret        Password             ${PASSWORD}
    Click Text         Log In
    Verify Text        Home                 timeout=30

Generate Current Timestamp
    [Documentation]    Creates a readable timestamp with date and hour
    [Arguments]        ${format}=%Y-%m-%d %H:%M:%S
    ${timestamp}=      Get Current Date    result_format=${format}
    RETURN             ${timestamp}

