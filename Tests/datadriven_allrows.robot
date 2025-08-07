*** Settings ***
Library    QForce
Library    DateTime
Library    DataDriver    reader_class=TestDataApi    name=opportunities.csv

Suite Setup       Open Browser        about:blank     Chrome
Suite Teardown    Close All Browsers
Test Template     Create New oportunity DD

*** Test Cases ***
Create New oportunity DD with ${opportunity_name}
    [Tags]    CreateOportunityDD

*** Keywords ***
Example Test
    [Arguments]    ${opportunity_name}    ${Stage}    ${Account}    ${AccountIndex}    ${LeadSource}
    # Your tests here, this is just an example
    # just use the values from excel using variable names
    # ClickText     ${opportunity_name}
    # VerifyText    ${Stage}
    # VerifyText    ${Account}
    # VerifyText    ${AccountIndex}
    # VerifyText    ${LeadSource}

Launch Salesforce
    [Documentation]             Opens browser
    Open Browser                about:blank                 chrome
    Go To                       ${SFORCE_LOGIN_URL}

Login To Salesforce
    [Documentation]             Logs into Salesforce using variables
    Type Text                   Username                    ${SFORCE_USERNAME}
    Type Secret                 Password                    ${SFORCE_PASSWORD}
    Click Text                  Log In

Navigate To Service App
    [Documentation]             Uses app launcher to navigate to Service app
    Launch App                  Service
    Verify Text                 Service

Navigate To Sales App
    [Documentation]             Uses app launcher to navigate to Service app
    Launch App                  Sales
    Verify Text                 Sales
Verify Service App Content
    [Documentation]             Verifies that Quarterly Performance and Assistant text are displayed
    Verify Text                 Quarterly Performance
    Verify Text                 Assistant
Go to opportunities
    [Documentation]             go to oportunities tab
    ClickText                   Opportunities
    Verify Text                 Opportunities
Create New oportunity DD
    [Documentation]             Create new opportunity from sales menu
    [Arguments]    ${opportunity_name}    ${Stage}    ${Account}    ${AccountIndex}    ${LeadSource}
    Launch Salesforce
    Login To Salesforce
    Navigate To Sales App
    Go to opportunities
    ClickText                   New
    UseModal                    On
    ${future_date}              Get Current Date            increment=30 days           result_format=%m/%d/%Y
    ${today_timestamp}          Get Current Date            result_format=%Y%m%d_%H%M%S
    ${opportunity_name_timestamp}                           Set Variable                ${opportunity_name}_${today_timestamp}
    TypeText                    *Close Date                 ${future_date}
    TypeText                    *Opportunity Name           ${opportunity_name_timestamp}
    PickList                    *Stage                      ${Stage}
    ComboBox                    Search Accounts...          ${Account}                  index=${AccountIndex}
    VerifyPickList              Lead Source                 ${LeadSource}
    ClickText                   Save                        partial_match=False
    UseModal                    Off
  