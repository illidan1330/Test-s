*** Settings ***
Documentation    Тест YaTur
Library    SeleniumLibrary    # Подключаем библиотеку Selenium
Resource    YaTurKEY.resource    # Подключаем ресурсный файл с кейвордами
Test Setup    web.Precondition: Open Browser And Maximize    SITE_URL=${SITE_URL}    BROWSER=${BROWSER}    # Предусловие
Test Teardown    web.Postcondition: Close Browser    # Постусловие
# Кейворды предусловия и постусловия содержатся в корневом ресурсном файле


*** Test Cases ***
TestRun Cadoru
    [Documentation]    Выполнение тестового задания Альтатек
    YaTurKEY.Show All Title Region
    YaTurKEY.Check Count Regions
    YaTurKEY.Check Description
