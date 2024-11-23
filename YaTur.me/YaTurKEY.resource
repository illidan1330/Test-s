*** Settings ***
Documentation    Кейворды для сайта YaTur
Resource         ../web.resource
Resource         YaTurVAR.resource
Library          SeleniumLibrary


*** Variables ***
${INDEX}    0
${DESCRIPTION}    //div[@class="area__popup-text-inner"]


*** Keywords ***
Show All Title Region
    [Documentation]    Открыть все регионы
    Wait Until Element Is Visible    ${ALL_REGION}
    Click Element    ${ALL_REGION}

Check Count Regions
    [Documentation]    Подсчет количества регионов
    Wait Until Element Is Visible    ${REGIONS}
    ${regions_count}=    Get Element Count    ${REGIONS}
    Should Be Equal As Numbers    ${regions_count}    11

Check Description    # robocop: disable=0503
    [Documentation]    Открытие каждого региона и проверка наличия блока "описание"
    Wait Until Element Is Visible    ${REGIONS}
    ${region_count}=    Get Element Count    ${REGIONS}
    FOR    ${INDEX}    IN RANGE    ${region_count}
        ${INDEX}=    Evaluate    ${INDEX}+1
        ${current_index}=    Set Variable    ${INDEX}
        ${region}=    Set Variable    (${REGIONS})[${current_index}]
        Wait Until Element Is Visible    ${region}
        Click Element    ${region}    # Открываем нужную карточку
        ${show_more_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${SHOW_MORE}    timeout=3s    # robocop: disable=0508
        IF    ${show_more_status}
            Click Element    ${SHOW_MORE}
        END
        Wait Until Element Is Visible    ${DESCRIPTION}
        ${descrtiption_text}=    Get Text    ${DESCRIPTION}
        Should Not Be Empty    ${descrtiption_text}
        Go Back
        Wait Until Element Is Visible    ${ALL_REGION}
        Click Element    ${ALL_REGION}
    END
