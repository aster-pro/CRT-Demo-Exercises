*** Settings ***
Library                         QForce
Library                         DateTime
Suite Setup                     OpenBrowser                 about:blank                 chrome
Resource                        ../resources/salesforce.resource
Suite Teardown                  Close All Browsers

*** Variables ***


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
    # Log To Console            ${future_date}
    # Log To Console            ${today_timestamp}
    # Log To Console            ${random_name}
    ${dynamic_timestamp}=       Get Current Date            result_format=%Y%m%d_%H%M%S
    ${dynamic_name}=            Set Variable                MyTest_${dynamic_timestamp}
    Log To Console              Raul ${dynamic_name}
    Launch Salesforce
    Login To Salesforce
    Navigate To Sales App
    Go to opportunities
    Create New oportunity