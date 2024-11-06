*** Settings ***
Documentation    Общие кейворды для всех тестов
Library          SeleniumLibrary


*** Keywords ***
Precondition: Open Browser And Maximize
    [Documentation]    Открыть браузер, развернуть на весь экран и задать скорость выполнения теста
    [Arguments]    ${SITE_URL}    ${BROWSER}
    Open Browser    url=${SITE_URL}    browser=${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.1s

Postcondition: Close Browser
    [Documentation]    Закрыть браузер после паузы
    Sleep    time_=5s
    Close Browser

Refresh Current Page
    [Documentation]    Обновить текущую страницу
    Reload Page
