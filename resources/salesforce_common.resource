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

Generate Filename Timestamp
    [Documentation]    Creates a timestamp safe for filenames
    ${timestamp}=      Get Current Date    result_format=%Y%m%d_%H%M%S
    RETURN             ${timestamp}

Generate ISO Timestamp
    [Documentation]    Creates an ISO format timestamp
    ${timestamp}=      Get Current Date    result_format=%Y-%m-%dT%H:%M:%S
    RETURN             ${timestamp}

Log With Timestamp
    [Documentation]    Logs a message with current timestamp
    [Arguments]        ${message}
    ${timestamp}=      Generate Current Timestamp
    Log                [${timestamp}] ${message}
