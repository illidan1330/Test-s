*** Settings ***
Documentation    Кейворды для сайта Sauce
Library    SeleniumLibrary
Resource    SauceLoginVAR.resource
Resource    ../../web.resource


*** Keywords ***
Authorization With True Login And True Password    # robocop: disable=0503
    [Documentation]    Авторизация при помощи вылидных данных
    # Авторизуемся с помощью валидных данных
    FOR    ${TrueLogin}    IN    @{TRUE_LOGIN_LIST}
        Wait Until Element Is Visible    locator=${INPUT_LOGIN}
        Input Text    locator=${INPUT_LOGIN}            text=${TrueLogin}
        Input Password    locator=${INPUT_PASSWORD}    password=${TRUE_PASSWORD}
        Click Button    locator=${LOGIN_BUTTON}
        # Проверяем успешная ли авторизация
        ${is_user_authorized}=
        ...    Run Keyword And Return Status
        ...    Wait Until Element Is Visible
        ...    locator=${ANCHORAUTH}
        ...    timeout=5s
        IF    ${is_user_authorized}
            # Если авторизация успешная, то выводим соответсвующее сообщение
            Log To Console    message=Пользователь ${TrueLogin} успешно авторизован
            # Разлогиниваемся
            Click Element    //*[@id="react-burger-menu-btn"]
            Sleep    time_=0.5s
            Click Element    //*[@id="logout_sidebar_link"]
        ELSE
            # Если авторизация не удалась, то проверяем не забанен ли пользователь
            ${is_user_banned}=
            ...    Run Keyword And Return Status
            ...    Wait Until Element Is Visible
            ...    locator=${BANNED_ERROR}
            IF    ${is_user_banned}
                # Если пользователь забанен, выводим соответсвующее сообщение
                Log To Console    message=Пользователь ${TrueLogin} заблокирован
            ELSE
                # Если пользователь не авторизован и не забанен, то произошла не известная ошибка
                Log To Console    message=С пользователем ${TrueLogin} возникла неизвестная ошибка
            END
        END
    END

Authorization With True Login And With False Password
    [Documentation]    Авторизация при помощи существующего логина и несуществующего пароля
    FOR    ${TrueLogin}    IN    @{TRUE_LOGIN_LIST}
        Wait Until Element Is Visible    locator=${INPUT_LOGIN}
        Input Text    locator=${INPUT_LOGIN}            text=${TrueLogin}
        Input Password    locator=${INPUT_PASSWORD}    password=${INVALID_PASSWORD}
        Click Button    locator=${LOGIN_BUTTON}
        Wait Until Element Is Visible
        ...    locator=${ERROR1}
        Sleep    0.5s
    END

Authorization With True Login And Without Password
    [Documentation]    Авторизация при помощи существующего логина и без пароля
    FOR    ${TrueLogin}    IN    @{TRUE_LOGIN_LIST}
        Wait Until Element Is Visible    locator=${INPUT_LOGIN}
        Input Text    locator=${INPUT_LOGIN}            text=${TrueLogin}
        Click Button    locator=${LOGIN_BUTTON}
        Wait Until Element Is Visible
        ...    locator=${ERROR3}
        Sleep    0.5s
    END

Authorization With False Login And True Password
    [Documentation]    Авторизация при помощи несуществующего логина и существующего пароля
    Wait Until Element Is Visible    locator=${INPUT_LOGIN}
    Input Text    locator=${INPUT_LOGIN}          text=${INVALID_LOGIN}
    Input Password    locator=${INPUT_PASSWORD}    password=${TRUE_PASSWORD}
    Click Button    locator=${LOGIN_BUTTON}
    Wait Until Element Is Visible
    ...    locator=${ERROR1}
    Sleep    time_=0.5s

Authorization With False Login And False Password
    [Documentation]    Автооризация при помощи несуществующих логина и пароля
    Wait Until Element Is Visible    locator=${INPUT_LOGIN}
    Input Text    locator=${INPUT_LOGIN}          text=${INVALID_LOGIN}
    Input Password    locator=${INPUT_PASSWORD}    password=${INVALID_PASSWORD}
    Click Button    locator=${LOGIN_BUTTON}
    Wait Until Element Is Visible
    ...    locator=${ERROR1}
    Sleep    time_=0.5s

Authorization With False Login And Without Password
    [Documentation]    Авторизация при помощи несущестующего логина и без пароля
    Wait Until Element Is Visible    locator=${INPUT_LOGIN}
    Input Text    locator=${INPUT_LOGIN}          text=${INVALID_LOGIN}
    Click Button    locator=${LOGIN_BUTTON}
    Wait Until Element Is Visible
    ...    locator=${ERROR3}
    Sleep    0.5s

Authorization Without Login And With True Password
    [Documentation]    Авторизация без логина и при помощи существующего пароля
    Wait Until Element Is Visible    locator=${INPUT_PASSWORD}
    Input Password    locator=${INPUT_PASSWORD}    password=${TRUE_PASSWORD}
    Click Button    locator=${LOGIN_BUTTON}
    Wait Until Element Is Visible
    ...    locator=${ERROR2}
    Sleep    time_=0.5s

Authorization Without Login And With False Password
    [Documentation]    Авторизация без логина и при помощи несуществующего пароля
    Wait Until Element Is Visible    locator=${INPUT_PASSWORD}
    Input Password    locator=${INPUT_PASSWORD}    password=${INVALID_PASSWORD}
    Click Button    locator=${LOGIN_BUTTON}
    Wait Until Element Is Visible
    ...    locator=${ERROR2}
    Sleep    time_=0.5s

Authorization Without Login And Without Password
    [Documentation]    Авторизация без ввода логина и пароля
    Wait Until Element Is Visible    locator=${INPUT_PASSWORD}
    Click Button    locator=${LOGIN_BUTTON}
    Wait Until Element Is Visible
    ...    locator=${ERROR2}
    Sleep    time_=0.5s
