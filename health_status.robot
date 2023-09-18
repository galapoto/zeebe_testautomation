*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://localhost:9600

*** Test Cases ***

Broker Startup Check
    ${response}=    GET  ${BASE_URL}/startup
    Check Broker Startup     ${response.status_code}

Broker Readiness Check
    ${response}=    GET  ${BASE_URL}/ready
    Check Broker Readiness   ${response.status_code}

Broker Health Check
    ${response}=    GET  ${BASE_URL}/health
    Check Broker Readiness   ${response.status_code}

Gateway Health Check
    ${response}=    GET  http://localhost:9600/actuator/health
    Check Gateway Health   ${response.status_code}

*** Keywords ***

Check Broker Startup
    [Arguments]    ${status_code}
    Run Keyword If    ${status_code} == 204    Log    Broker startup successful!
    ...    ELSE IF    ${status_code} == 503    Log    Broker Startup failed!
    ...    ELSE    Fail    Unexpected status code: ${status_code}

Check Broker Readiness
    [Arguments]    ${status_code}
    Run Keyword If    ${status_code} == 204    Log    Broker is ready!
    ...    ELSE IF    ${status_code} == 503    Log    Broker is not ready!
    ...    ELSE    Fail    Unexpected status code: ${status_code}

Check Broker Health
    [Arguments]    ${status_code}
    Run Keyword If    ${status_code} == 204    Log    Broker is healthy!
    ...    ELSE IF    ${status_code} == 503    Log    Broker is not healthy!
    ...    ELSE    Fail    Unexpected status code: ${status_code}

Check Gateway Health
    [Arguments]    ${status_code}
    Run Keyword If    ${status_code} == 200    Log    Gateway is healthy!
    ...    ELSE IF    ${status_code} == 503    Log    Gateway is not healthy!
    ...    ELSE    Fail    Unexpected status code: ${status_code}

