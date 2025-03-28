# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Documentation                   Example / template for REST API automation
Library                         RequestsLibrary             # import library "RequestsLibrary" for REST API testing
Library                         DateTime                    # imported for date conversion in second test
Resource                        ../resources/common.resource


*** Variables ***
${ISBN_10}                      0201558025
${EXPECTED_TITLE}               Concrete mathematics
${EXPECTED_YEAR}                1994
${EXPECTED_AUTHOR}              Ronald L. Graham
${BASE_URL}                     http://216.10.245.166

*** Test Cases ***

Verify Book details
    [Documentation]             Verify Book details using Open Library REST API (https://openlibrary.org/dev/docs/api/books)
    [tags]                      API    GET_API    GET
    # Create a session using Create Session
    ${var}=                     Create Session              openbookslib                http://openlibrary.org/api

    # Populate query and parameters
    ${query}=                   Set Variable                bibkeys=ISBN:${ISBN_10}
    &{params}=                  Create Dictionary           format=json                 jscmd=data

    # Call a specific endpoint with our query using Get Request. Get response to a varibal
    ${resp} =                   Get On Session              openbookslib                /books?${query}             params=&{params}
    # Check and log status code from the response
    Should Be Equal As Strings                              ${resp.status_code}         200
    Log                         ${resp.text}

    # parse returned data to variables using helper keyword from resources
    ${book_info}=               Get Field Value From Json                               ${resp.text}                ISBN:${ISBN_10}
    Log                         ${book_info}
    ${title}=                   Get From Dictionary         ${book_info}                title
    ${published}=               Get From Dictionary         ${book_info}                publish_date
    ${authors}=                 Get From Dictionary         ${book_info}                authors
    Log                         ${authors}
    ${main_author_name}=        Get From Dictionary         ${authors[0]}               name

    # Verify returned information against known values
    Should Be Equal As Strings                              ${title}                    ${EXPECTED_TITLE}
    Should Be Equal As Strings                              ${published}                ${EXPECTED_YEAR}
    Should Be Equal As Strings                              ${main_author_name}         ${EXPECTED_AUTHOR}


Add Book into Library Database With json response
    [Tags]    API    API_POST    POST
    #Change the aisle value in every execution: successfully added, Book Already Exists ****
    Create Session    Addbook    ${BASE_URL}    verify=true
    &{req_body}    Create Dictionary    name=RobotFramework    isbn=MEX    aisle=2062211    author=Antonio
    ${response}    Post On Session      Addbook     ${BASE_URL}/Library/Addbook.php    json=${req_body}    expected_status=200
    Log    ${response.json()}
    ${book_ID}    Get From Dictionary    ${response.json()}    ID
    Set Global Variable     ${book_ID}
    ${responseMessage}    Get From Dictionary    ${response.json()}    Msg
    Log    ${book_ID}
    Log    ${responseMessage}
#    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
#    Should Be Equal As Strings    successfully added    ${responseMessage}
#    Should Be Equal As Strings    Book Already Exists    ${response.json()}[Msg]
#    Should Be Equal As Strings    Book Already Exists    ${responseMessage}
    Status Should Be    200    ${response}
