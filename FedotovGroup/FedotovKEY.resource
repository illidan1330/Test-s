*** Settings ***
Documentation    Кейворды для ФедотовГруп
Library    SeleniumLibrary
Resource    FedotovVAR.resource
Resource    ../web.resource


*** Keywords ***
Show Block Legislation
    [Documentation]    Покажи блок "Законодательство"
    Wait Until Element Is Visible    ${BLOCK_PANEL}
    Click Element    ${BLOCK_LEGISLATION}

Show All Elements In Block
    [Documentation]    Показать все элементы из блока
    # Ждемс, что на странице есть элемент "Загрузить еще"
    Wait Until Page Contains Element    ${SHOW_MORE}
    # Пролистать страницу до кнопки "Загрузить еще"
    Scroll Element Into View    ${SHOW_MORE_MODULE}
    # Создаем переменную которая подтрверждает видимость кнопки "Загрузить еще"
    ${show_more_active}    Set Variable    ${True}
    WHILE    ${show_more_active}
        # Нажимаем "Загрузить еще"
        Click Element    ${SHOW_MORE}
        # Элемент "Загрузить еще" всегда есть на странице, но не видим когда закончил раскрытие блока
        IF  ${show_more_active}
            Wait Until Page Contains Element    ${SHOW_MORE}
            Scroll Element Into View    ${SHOW_MORE_MODULE}
            ${show_more_active}
            ...    Run Keyword And Return Status
            ...    Wait Until Element Is Visible
            ...    ${SHOW_MORE}
            ...    timeout=1s
        END
        # Мини пауза, так как сайт слееегка не успевает
        Sleep    time_=0.5s
    END

Click All Elements In Block
    [Documentation]    Прокликать все элементы из блока
    # Берем все элементы из блока
    @{element_list}    Get WebElements    locator=//a[@class="t-feed__link js-feed-post-link"]
    FOR    ${element}    IN    @{element_list}
        # Запоминаем текущий элемент и открываем его
        ${element_name}    Get Text    locator=${element}
        Click Element    locator=${element}    modifier=CONTROL
        # Сверяем, что открылся нужный элемент
        Switch Window    NEW
        Run Keyword And Continue On Failure
        ...    Wait Until Element Is Visible
        ...    locator=xpath=/html/body//*[text()="${element_name}"]
        ${window_element_name}
        ...    Run Keyword And Continue On Failure
        ...    Get Text
        ...    locator=xpath=/html/body//*[text()="${element_name}"]
        Run Keyword And Continue On Failure
        ...    Should Be Equal    ${element_name}   ${window_element_name}
        # Закрываем вкладку и переключаемся на стартовую для кейсворда
        Close Window
        Switch Window    MAIN
    END
# Run Keyword And Continue On Failure    Wait Until Element Is Visible    locator=//*[text()="${element_name}"]
# //h1[@class="js-feed-post-title t-feed__post-popup__title t-title t-title_xxs"]
# //html/body//text()[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'термин')]
# /html/body//*[text()="$element_name"]
