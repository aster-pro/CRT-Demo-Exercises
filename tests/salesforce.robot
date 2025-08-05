*** Settings ***
Library    QForce
Suite Setup        Open Browser    about:blank    chrome
Suite Teardown     Close Browser

*** Test Cases ***
Test Chrome Opens
    [Documentation]    Verifica que Chrome puede abrir Google y mostrar el texto esperado
    [Tags]    smoke    browser
    
    # Navegar a Google
    Go To    https://www.google.com
    
    # Verificar que la página se cargó correctamente
    Verify Text    Google
    
    # Verificación adicional del título de la página
    Verify Title    Google
