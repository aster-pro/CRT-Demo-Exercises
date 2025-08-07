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

Generate Future Date One Month
    [Documentation]    Calculates current date + 1 month and formats as dd/mm/yyyy
    ${current_date}=       Get Current Date
    ${future_date}=        Add Time To Date           ${current_date}    30 days
    ${formatted_date}=     Convert Date               ${future_date}     result_format=%d/%m/%Y
    RETURN                 ${formatted_date}
