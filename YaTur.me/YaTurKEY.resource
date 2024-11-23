*** Settings ***
Documentation    Кейворды для сайта YaTur
Resource         ../web.resource    # Подключаем корневой ресурный файл с универсальными кейвордами для всех проектов
Resource         YaTurVAR.resource    # Подключаем локальный ресурсный файл с переменными
Library          SeleniumLibrary    # Подключаем библиотеку Selenium


*** Variables ***
${INDEX}    0    # Рабочая переменная, называющая текущую карточку региона
${DESCRIPTION}    //div[@class="area__popup-text-inner"]    # Локатор на блок с


*** Keywords ***
Show All Title Region
    [Documentation]    Открыть все регионы
    Wait Until Element Is Visible    ${ALL_REGION}    # Ждем пока загрузится кнопка "Все районы"
    Click Element    ${ALL_REGION}    # Нажимаем на кнопку "Все районы"

Check Count Regions
    [Documentation]    Подсчет количества регионов
    Wait Until Element Is Visible    ${REGIONS}    # Ждем пока отобразятся все карточки с регионами
    ${regions_count}=    Get Element Count    ${REGIONS}    # Считаем сколько регионов есть
    Should Be Equal As Numbers    ${regions_count}    11    # Сверяем количество карточек регионов и заданное число

Check Description    # robocop: disable=0503
    [Documentation]    Открытие каждого региона и проверка наличия блока "описание"
    Wait Until Element Is Visible    ${REGIONS}    # Ждем пока отобразятся все карточки с регионами
    ${region_count}=    Get Element Count    ${REGIONS}    # Считаем сколько регионов есть
    FOR    ${INDEX}    IN RANGE    ${region_count}    # Запускаем цикл который открывает карточки по очереди
        ${INDEX}=    Evaluate    ${INDEX}+1    # Увеличиваем индекс
        ${current_index}=    Set Variable    ${INDEX}    # Создаем переменную индекса XPath карточки
        ${region}=    Set Variable    (${REGIONS})[${current_index}]    # Задаем точный путь к нужной карточке
        Wait Until Element Is Visible    ${region}    # Ждем что нужная карточка видима
        Click Element    ${region}    # Открываем нужную карточку
        ${show_more_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${SHOW_MORE}    timeout=3s    # robocop: disable=0508
        # Проверяем видимость кнопки "Полное описание"и возвращаем ответ - True/False
        IF    ${show_more_status}    # Если кнопка "Полное описание" видима
            Click Element    ${SHOW_MORE}    # То нажимаем ее
        END
        Wait Until Element Is Visible    ${DESCRIPTION}    # Ждем, что подгрузилось описание
        ${descrtiption_text}=    Get Text    ${DESCRIPTION}    # Берем текст из описания
        Should Not Be Empty    ${descrtiption_text}    # Проверяем что текст есть
        Go Back    # Переходим назад на главную страницу
        Wait Until Element Is Visible    ${ALL_REGION}    # Ждем пока загрузится кнопка "Все районы"
        Click Element    ${ALL_REGION}    # Нажимаем на кнопку "Все районы"
    END
