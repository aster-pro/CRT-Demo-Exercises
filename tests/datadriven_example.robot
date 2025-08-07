*** Settings ***
Library    QWeb
Library    DataDriver    reader_class=TestDataApi    name=salesforce_test.xlsx
Suite Setup       Open Browser        about:blank     Chrome
Suite Teardown    Close All Browsers
Test Template     Example Test
*** Test Cases ***
Example Test with ${opportunity_name} ${account_name} ${stage}
    [Tags]    datadriven
*** Keywords ***
Example Test
    [Arguments]    ${opportunity_name}    ${account_name}    ${stage}    ${type}    ${probability}    ${amount}    ${lead_source}    ${next_step}    ${description}

    Log    ${opportunity_name}
    Log    ${account_name}
    Log    ${stage}
    Log    ${type}
    Log    ${probability}
    Log    ${amount}
    Log    ${lead_source}
    Log    ${next_step}
    Log    ${description}




