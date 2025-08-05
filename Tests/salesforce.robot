*** Settings ***
Library                         QForce
Library                         DateTime
Library                         String
Suite Setup                     OpenBrowser                 about:blank                 chrome
Resource                        ../resources/salesforce.resource
Suite Teardown                  Close All Browsers

*** Variables ***
${SFORCE_LOGIN_URL}             https://login.salesforce.com
${SFORCE_USERNAME}              ${EMPTY}
${SFORCE_PASSWORD}              ${EMPTY}
${future_date}                  Get Current Date            increment=30 days           result_format=%m/%d/%Y
${today_timestamp}              Get Current Date            result_format=%Y%m%d_%H%M%S
${random_name}                  Set Variable                TestOpp_${today_timestamp}

*** Test Cases ***
Verify Service App Content
    [Documentation]             Login to Salesforce, navigate to Service app and verify Quarterly Performance and Assistant text are displayed
    [Tags]                      Salesforce
    Launch Salesforce
    Login To Salesforce
    Navigate To Service App
    Verify Service App Content

Create New oportunity in Sales App
    [Documentation]             Login to Salesforce, navigate to Service app and verify Quarterly Performance and Assistant text are displayed
    [Tags]                      NewOportunity
    Log To Console              ${future_date}
    Log To Console              ${today_timestamp}
    Log To Console              ${random_name}
    Launch Salesforce
    Login To Salesforce
    Navigate To Sales App
    Go to opportunities
    Create New oportunity