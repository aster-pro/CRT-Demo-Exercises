Library    QWeb

Suite Setup       Open Browser        about:blank     Chrome
Suite Teardown    Close All Browsers

*** Test Cases ***
Example test ${opportunity_name} ${acccount_name} ${age}
    Log    ${opportunity_name}
    Log    ${acccount_name}
    Log    ${age}    
    # Your tests here, this is just an example
    # just use the values from excel using variable names
    # ClickText     ${opportunity_name}
    # VerifyText    ${acccount_name}
    # VerifyText    ${age}
    # VerifyText    ${city}
