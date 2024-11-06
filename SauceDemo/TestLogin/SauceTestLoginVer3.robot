*** Settings ***
Documentation    Тестирование формы входа в аккаунт
Library    SeleniumLibrary
Resource    SauceLoginKEY.resource
Suite Setup    web.Precondition: Open Browser And Maximize    SITE_URL=${SITE_URL}    BROWSER=${BROWSER}
Test Teardown    web.Refresh Current Page
Suite Teardown    web.Postcondition: Close Browser


*** Test Cases ***
Standsrt Auth With Login And Password
    [Documentation]    Стандартная авторизация
    [Template]    Standart Auth With Login And Password
    # Валидный логин и валидный пароль
    ${TRUE_LOGIN}       ${TRUE_PASSWORD}
    # Валидный логин и невалидный пароль
    ${TRUE_LOGIN}       ${INVALID_PASSWORD}
    # Валидный логин и пустое поле ввода пароля
    ${TRUE_LOGIN}       ${EMPTY}
    # Невалидный логин и валидный пароль
    ${INVALID_LOGIN}    ${TRUE_PASSWORD}
    # Невалидный логин и невалидный пароль
    ${INVALID_LOGIN}    ${INVALID_PASSWORD}
    # Невалидный логин и пустое поле ввода пароля
    ${INVALID_LOGIN}    ${EMPTY}
    # Пустое поле ввода логина и валидный пароль
    ${EMPTY}            ${TRUE_PASSWORD}
    # Пустое поле ввода логина и невалидный пароль
    ${EMPTY}            ${INVALID_PASSWORD}
    # Пустые поля ввода логина и пароля
    ${EMPTY}            ${EMPTY}


*** Keywords ***
Standart Auth With Login And Password
    [Documentation]    Стандартная авторизация
    [Arguments]    ${login}    ${password}
    Wait Until Element Is Visible    locator=${INPUT_LOGIN}
    Input Text                       locator=${INPUT_LOGIN}            text=${login}
    Input Password                   locator=${INPUT_PASSWORD}         password=${password}
    Click Button                     locator=${LOGIN_BUTTON}
    # Проверяем успешная ли авторизация
    ${is_user_authorized}=
    ...    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    locator=${ANCHORAUTH}
    ...    timeout=5s
    IF    ${is_user_authorized}
        # Если авторизация успешная, то выводим соответсвующее сообщение
        Log To Console    message=Пользователь ${login} успешно авторизован
        # Разлогиниваемся
        Click Element     //*[@id="react-burger-menu-btn"]
        Sleep             time_=0.5s
        Click Element     //*[@id="logout_sidebar_link"]
    ELSE
        # Если авторизация не успешная, то выводим соответсвующее сообщение
        Log To Console    message=Пользователь ${login} не был авторизован
    END
