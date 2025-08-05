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

Login Salesforce And Navigate To Analytics
    [Documentation]    Inicia sesión en Salesforce y navega a la aplicación Analytics con verificaciones mejoradas
    [Tags]    salesforce    login    analytics
    
    # Verificar que el navegador está funcionando correctamente
    Go To    https://www.google.com
    Verify Text    Google
    
    # Navegar a la instancia de Salesforce con timeout extendido
    Go To    https://velocity-page-1863.scratch.my.salesforce.com/    timeout=30
    
    # Verificar que la página de Salesforce se cargó correctamente
    Verify Text    Salesforce    timeout=20
    
    # Verificar que aparece el formulario de login
    Verify Text    Username    timeout=15
    Verify Text    Password    timeout=15
    
    # Ingresar credenciales de usuario con timeouts explícitos
    Type Text    Username    ${Username}    timeout=10
    Type Secret    Password    ${Password}    timeout=10
    
    # Verificar que las credenciales se ingresaron correctamente
    ${username_filled}=    Is Text    ${Username}
    Run Keyword If    not ${username_filled}    Type Text    Username    ${Username}
    
    # Hacer clic en el botón de inicio de sesión
    Click Text    Log In    timeout=10
    
    # Verificar que el login fue exitoso esperando elementos de la página principal
    Verify Text    Home    timeout=30
    
    # Verificar que el App Launcher está disponible
    Verify Text    App Launcher    timeout=15
    
    # Lanzar la aplicación Analytics con timeout extendido
    Launch App    Analytics    timeout=30
    
    # Verificar que la aplicación Analytics se cargó correctamente
    Verify Text    Analytics    timeout=20
    
    # Verificar que la sección correcta fue cargada
    Verify Text    sales    timeout=15
    
    # Verificación adicional de que estamos en la página correcta
    Verify Text    Dashboard    timeout=10
