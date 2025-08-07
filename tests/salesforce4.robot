*** Settings ***
Library    QForce
Library    DateTime
Library    Collections
Suite Setup        Open Browser    about:blank    chrome
Suite Teardown     Close Browser

*** Variables ***
${OPPORTUNITY_BASE_NAME}    Opportunity_Auto
${TOTAL_DATA_ROWS}    5    # Ajustar según número de filas en Excel

*** Keywords ***
Generate Timestamp Based Data Index
    [Documentation]    Genera índice basado en timestamp para seleccionar fila del Excel
    ${current_time}=    Get Current Date    result_format=epoch
    ${time_int}=    Convert To Integer    ${current_time}
    ${data_index}=    Evaluate    ${time_int} % ${TOTAL_DATA_ROWS}
    ${row_number}=    Evaluate    ${data_index} + 1
    Log    🕒 Timestamp: ${current_time} | Índice calculado: ${data_index} | Fila Excel: ${row_number}    INFO
    RETURN    ${row_number}

Generate Opportunity Name With Timestamp
    [Documentation]    Genera nombre único usando timestamp
    [Arguments]    ${base_name}=${OPPORTUNITY_BASE_NAME}
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S_%f
    ${opportunity_name}=    Set Variable    ${base_name}_${timestamp}
    Log    📝 Nombre generado: ${opportunity_name}    INFO
    RETURN    ${opportunity_name}

Select Data Set By Timestamp
    [Documentation]    Selecciona conjunto de datos basado en timestamp
    ${row_index}=    Generate Timestamp Based Data Index
    Log    🎯 Usando conjunto de datos de fila: ${row_index}    INFO
    Log    📊 Stage: ${Stage} | Account: ${Account} | Amount: ${Amount}    INFO
    Log    📊 Type: ${Type} | Lead Source: ${Lead_Source}    INFO
    RETURN    ${row_index}

Realizar Login Completo En Salesforce
    [Documentation]    Login usando credenciales del Excel o variables CRT
    Verificar Navegador Funcionando
    Navegar A Salesforce
    Verificar Formulario Login
    Ingresar Credenciales
    Ejecutar Login

Crear Opportunity Con Datos Timestamp
    [Documentation]    Crea opportunity usando datos seleccionados por timestamp
    ${data_row}=    Select Data Set By Timestamp
    ${opportunity_name}=    Generate Opportunity Name With Timestamp
    
    Navegar A Opportunities
    Abrir Modal Nueva Opportunity
    Configurar Fecha Cierre
    Llenar Datos Opportunity Con Timestamp    ${opportunity_name}
    Guardar Opportunity
    Log    ✅ Opportunity creada: ${opportunity_name} con datos de fila ${data_row}    INFO

Llenar Datos Opportunity Con Timestamp
    [Documentation]    Llena formulario con datos seleccionados automáticamente
    [Arguments]    ${opportunity_name}
    Type Text    *Opportunity Name    ${opportunity_name}    timeout=10
    PickList    *Stage    ${Stage}    timeout=10
    ComboBox    Search Accounts...    ${Account}    timeout=10
    TypeText    Amount    ${Amount}    timeout=10
    PickList    Type    ${Type}    timeout=10
    PickList    Lead Source    ${Lead_Source}    timeout=10
    TypeText    Description    ${Description}    timeout=10

Ejecutar Flujo Completo Con Timestamp
    [Documentation]    Flujo completo usando selección automática por timestamp
    ${start_time}=    Get Current Date    result_format=%H:%M:%S
    Log    🚀 Iniciando test automático a las ${start_time}    INFO
    
    Realizar Login Completo En Salesforce
    Crear Opportunity Con Datos Timestamp
    
    ${end_time}=    Get Current Date    result_format=%H:%M:%S
    Log    🏁 Test completado a las ${end_time}    INFO

Verificar Navegador Funcionando
    [Documentation]    Verifica que el navegador está funcionando
    Go To    https://www.google.com
    Verify Text    Google

Navegar A Salesforce
    [Documentation]    Navega a Salesforce
    Go To    https://ability-velocity-7734.scratch.my.salesforce.com/    timeout=30
    Verify Text    Salesforce    timeout=20

Verificar Formulario Login
    [Documentation]    Verifica formulario de login
    Verify Text    Username    timeout=15
    Verify Text    Password    timeout=15

Ingresar Credenciales
    [Documentation]    Ingresa credenciales
    Type Text    Username    ${username}    timeout=10
    Type Secret    Password    ${password}    timeout=10

Ejecutar Login
    [Documentation]    Ejecuta login
    Click Text    Log In    timeout=10
    Verify Text    Home    timeout=30
    Verify Text    App Launcher    timeout=15

Navegar A Opportunities
    [Documentation]    Navega a Opportunities
    Click Text    Opportunities    timeout=30

Abrir Modal Nueva Opportunity
    [Documentation]    Abre modal nueva opportunity
    ClickText    New
    UseModal    On

Configurar Fecha Cierre
    [Documentation]    Configura fecha de cierre
    ClickText    Select a date for Close Date
    Click Text    Close Date    timeout=10
    Sleep    1s
    Click Text    Today    timeout=10

Guardar Opportunity
    [Documentation]    Guarda opportunity
    ClickText    Save    partial_match=False
    UseModal    Off

*** Test Cases ***
Test Salesforce Con Seleccion Automatica Por Timestamp
    [Documentation]    Test que usa timestamp para seleccionar datos automáticamente del Excel
    [Tags]    salesforce    timestamp    auto-selection    opportunity    dynamic
    Ejecutar Flujo Completo Con Timestamp
