*** Settings ***
Library    QForce
Library    DateTime
Suite Setup        Open Browser    about:blank    chrome
Suite Teardown     Close Browser

*** Variables ***
${OPPORTUNITY_BASE_NAME}    Rodrigo

*** Keywords ***
Generate Opportunity Name
    [Documentation]    Genera un nombre único para la opportunity con timestamp
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${opportunity_name}=    Set Variable    ${OPPORTUNITY_BASE_NAME}_${timestamp}
    Log    📝 Nombre generado: ${opportunity_name}    INFO
    RETURN    ${opportunity_name}
    
*** Test Cases ***
Login Salesforce And Navigate To Analytics
    [Documentation]    Inicia sesión en Salesforce y navega a la aplicación Analytics con verificaciones mejoradas
    [Tags]    salesforce    login    analytics
    ${opportunity_name}=    Generate Opportunity Name
    Log    📝 Nombre generado para opportunity: ${opportunity_name}    INFO
    # Verificar que el navegador está funcionando correctamente
    Go To    https://www.google.com
    Verify Text    Google
    
    # Navegar a la instancia de Salesforce con timeout extendido
    Go To    https://ability-velocity-7734.scratch.my.salesforce.com/    timeout=30
    
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
    
    # Lanzar la aplicación Opportunities con timeout extendido
    Click Text    Opportunities    timeout=30
    ClickText    New
    UseModal    On
    ClickText    Select a date for Close Date
    Click Text    Close Date    timeout=10
    Sleep    1s
    Click Text    Today    timeout=10
    Type Text    *Opportunity Name    ${opportunity_name}    timeout=10
    PickList    *Stage    Prospecting
    # Buscar y seleccionar cuenta
    ComboBox    Search Accounts...    TestAcc_20250806_214841
    TypeText    Amount    10000
    PickList    Type    New Business
    PickList    Lead Source    Trade Show
    TypeText    Description    hola
    ClickText    Save    partial_match=False
    UseModal    Off
    
