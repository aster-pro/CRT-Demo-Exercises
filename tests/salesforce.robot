*** Settings ***
Library                    QForce
Resource                   ../resources/salesforce_common.resource
Suite Setup                OpenBrowser                 about:blank            chrome

*** Variables ***
${BROWSER}                 chrome
${opportunity_name}=    Set Variable     Yair Test ${timestamp}

*** Test Cases ***
Salesforce Service Page Validation Test
    [Documentation]        Test case to login to Salesforce and validate Service page
    [Tags]                 salesforce                  service                login

    # Navigate to the page URL
    GoTo                   ${URL}

    # Login to Salesforce
    Login To Salesforce

    # Navigate to Service app
    Launch App             Service

    # Verify Service page loaded correctly
    Verify Text            Service                     timeout=20
    Verify Text            Cases                       timeout=10
    Verify Text            Accounts                    timeout=10

    # Additional validation for Service page elements
    Verify Text            Quarterly Performance
    Verify Text            Today's Events


Salesforce Sales New Opportunity Validation Test
    # Navigate to Sales app
    Launch App             Sales
    Verify Text            Sales                       timeout=20

    # Navigate to Opportunities tab
    Click Text             Opportunities
    Verify Text            Opportunities               timeout=15

    # Open New Opportunity creation window
    Click Text             New
    Verify Text            New Opportunity             timeout=10

    # Verify the opportunity creation form is displayed
    Verify Text            Opportunity Name
    Verify Text            Close Date
    Verify Text            Stage
    Verify Text            Account Name

    # Verify form buttons are present
    Verify Text            Save
    Verify Text            Cancel

    # Fill the required fields
    TypeText               *Opportunity Name        ${opportunity_name}    
    ComboBox               Search Accounts...          Salesforce             index=1
    PickList               Type                        Existing Business


    ClickText              Select a date for Close Date
    ClickText              6
    ClickText              6
    PickList               *Stage                      Id. Decision Makers
    ClickText              Save & New
    UseModal               On
    UseModal               Off

    # Log successful completion without creating the opportunity
    Log                    New Opportunity form opened successfully - ready for data entry
