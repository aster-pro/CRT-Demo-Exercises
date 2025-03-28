*** Settings ***
Library                Collections

*** Variables ***

*** Keywords ***
Get Field Value From Json
    [Documentation]    The value of json argument expected to be one dictionary
    [Arguments]        ${json}                ${field_name}
    ${object} =        Evaluate               json.loads("""${json}""")
    Log                ${object}
    ${fieldValue} =    Get From Dictionary    ${object}                   ${field_name}
    RETURN           ${fieldValue}
