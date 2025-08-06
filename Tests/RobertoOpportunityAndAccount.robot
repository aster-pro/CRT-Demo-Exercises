*** Settings ***
Library                         QForce
Library                         DateTime
Resource                        ../resources/salesforcecommon.resource
Suite Setup                     Setup Browser

*** Variables ***
${BROWSER}                      chrome
${USERNAME}                     ${EMPTY}
${PASSWORD}                     ${EMPTY}
${SF_URL}                       https://ability-velocity-7734.scratch.my.salesforce.com/

*** Test Cases ***
Create Opportunity With Roberto And Timestamp
    [Documentation]             Test case to login to Salesforce, access Sales app, and create opportunity with Roberto plus timestamp
    [Tags]                      salesforce                  opportunity    sales    roberto

    Login To Salesforce
    Access Sales App
    Create New Opportunity With New Account Name
    Validate Probability
    Logout From Salesforce