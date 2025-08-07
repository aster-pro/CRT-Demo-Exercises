*** Settings ***
Library            QWeb
Library            DataDriver             reader_class=TestDataApi    name=DemoDataDriven.xlsx

Suite Setup        Open Browser           about:blank                 Chrome
Suite Teardown     Close All Browsers
Test Template      Example Test

*** Test Cases ***
Example Test with ${opportunity_name} ${acccount_name} ${age}

*** Keywords ***
Example Test
    [Arguments]    ${opportunity_name}    ${acccount_name}            ${age}                      ${city}
    # Your tests here, this is just an example
    # just use the values from excel using variable names
    Log            ${opportunity_name}
    Log            ${acccount_name}
    Log            ${age}
    Log            ${city}