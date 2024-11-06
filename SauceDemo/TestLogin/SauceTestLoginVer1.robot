*** Settings ***
Documentation    Тестирование формы входа в аккаунт
Library    SeleniumLibrary
Resource    SauceLoginKEY.resource
Suite Setup    web.Precondition: Open Browser And Maximize    SITE_URL=${SITE_URL}    BROWSER=${BROWSER}
Suite Teardown    web.Postcondition: Close Browser


*** Variables ***
@{LOGIN_LIST}
...    standard_user
...    locked_out_user
...    ${EMPTY}
...    GeraltFromRivia


*** Test Cases ***
Authorization With Login And Password
    [Documentation]    Авторизация при помощи вылидных данных
    [Template]    Authorization With Login And Password
    # Несуществующий пароль №1
    InvalidPassword
    # Несуществующий пароль №2
    ${EMPTY}
    # Существующий пароль
    ${TRUE_PASSWORD}


*** Keywords ***
Authorization With Login And Password    # robocop: disable=0501
    [Documentation]    Авторизация при помощи вылидных данных
    [Arguments]    ${Password}
    # Авторизуемся
    FOR    ${Login}    IN    @{LOGIN_LIST}
        Wait Until Element Is Visible    locator=${INPUT_LOGIN}
        Input Text                       locator=${INPUT_LOGIN}            text=${Login}
        Input Password                   locator=${INPUT_PASSWORD}         password=${Password}
        Click Button                     locator=${LOGIN_BUTTON}
        # Проверяем успешная ли авторизация
        ${is_user_authorized}=
        ...    Run Keyword And Return Status
        ...    Wait Until Element Is Visible
        ...    locator=${ANCHORAUTH}
        ...    timeout=5s
        IF    ${is_user_authorized}
            # Если авторизация успешная, то выводим соответсвующее сообщение
            Log To Console    message=Пользователь ${Login} успешно авторизован
            # Разлогиниваемся
            Click Element     //*[@id="react-burger-menu-btn"]
            Sleep             time_=0.5s
            Click Element     //*[@id="logout_sidebar_link"]
        ELSE
            # Если авторизация не удалась, то проверяем не забанен ли пользователь
            ${is_user_banned}=
            ...    Run Keyword And Return Status
            ...    Wait Until Element Is Visible
            ...    locator=${BANNED_ERROR}
            ...    timeout=0.5s
            IF    ${is_user_banned}
                # Если пользователь забанен, выводим соответсвующее сообщение
                Log To Console         message=Пользователь ${Login} заблокирован
                Reload Page
            ELSE
                # Если пользователь не авторизован и не забанен, проверяем существование в системе
                ${user_not_found}=
                ...    Run Keyword And Return Status
                ...    Wait Until Element Is Visible
                ...    locator=${ERROR1}
                ...    timeout=0.5s
                IF  ${user_not_found}
                    # Если пользователь не найден, выводим соотвествующее сообщение
                    Log To Console       message=Пользователь логин:${Login} в системе не найден
                    Reload Page
                ELSE
                    # Проверяем был ли введен логин, если вышеуказанные проверки провалены
                    ${login_not_found}=
                    ...    Run Keyword And Return Status
                    ...    Wait Until Element Is Visible
                    ...    locator=${ERROR2}
                    ...    timeout=0.5s
                    IF    ${login_not_found}
                        # Если имя пользователя небыло введено, выводим соотвествующее сообщение
                        Log To Console          message=Введите имя пользователя
                        Reload Page
                    ELSE
                        # Проверяем был ли введен пароль, если вышеуказанные проверки провалены
                        ${password_not_found}=
                        ...    Run Keyword And Return Status
                        ...    Wait Until Element Is Visible
                        ...    locator=${ERROR3}
                        ...    timeout=0.5s
                        IF  ${password_not_found}
                            # Если парооль небыл введен, выводим соотвествующее сообщение
                            Log To Console           message=Введите пароль для пользователя ${Login}
                            Reload Page
                        ELSE
                            # Если результат не попадает под условия теста
                            Log To Console    message=Возникла неизвестная ошибка
                        END
                    END
                END
            END
        END
    END
