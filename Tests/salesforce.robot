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
    Launch Salesforce
    Login To Salesforce
    Navigate To Sales App
    Go to opportunities
    Create New oportunity

Create New Account in Opportunity
    [Documentation]             Login to Salesforce, navigate to Service app and verify Quarterly Performance and Assistant text are displayed
    [Tags]                      NewOportunity
    Launch Salesforce
    Login To Salesforce
    Navigate To Sales App
    Go to opportunities
    Create New oportunity