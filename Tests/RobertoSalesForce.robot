*** Settings ***
Library                         QForce
Resource                        ../resources/salesforcecommon.resource
Suite Setup                     Setup Browser

*** Variables ***
${BROWSER}                      chrome
${USERNAME}                     ${EMPTY}
${PASSWORD}                     ${EMPTY}
${SF_URL}                       https://velocity-page-1863.scratch.my.salesforce.com/

*** Test Cases ***
Login To Salesforce And Access Bolt Solutions App
    [Documentation]             Test case to login to Salesforce and verify access to Bolt Solutions app
    [Tags]                      salesforce                  login          bolt-solutions
    
    Login To Salesforce
    Access Bolt Solutions App
    Verify Bolt Solutions App Access
    Logout From Salesforce

