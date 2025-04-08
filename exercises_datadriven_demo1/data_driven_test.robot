*** Settings ***
Library            QWeb
Library            DataDriver                  reader_class=TestDataApi    name=clients_and_states.xlsx

Suite Setup        Open Browser                about:blank                 Chrome
Suite Teardown     Close All Browsers
Test Template      Data Driven Test Demo

*** Test Cases ***
Data Driven Test Demo with ${name} ${lastname} ${state}

*** Keywords ***
Data Driven Test Demo
    [Arguments]    ${name}                     ${lastname}                 ${state}
    GoTo           http://uitestingplayground.com/textinput
    TypeText       MyButton                    ${name} ${lastname} ${state}
    ClickText      Button That Should Change it's Name Based on Input Value
    ClickText      ${name} ${lastname} ${state}
