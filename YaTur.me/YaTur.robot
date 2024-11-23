*** Settings ***
Documentation    Тест YaTur
Library    SeleniumLibrary
Resource    YaTurKEY.resource
Test Setup    web.Precondition: Open Browser And Maximize    SITE_URL=${SITE_URL}    BROWSER=${BROWSER}
Test Teardown    web.Postcondition: Close Browser


*** Test Cases ***
TestRun Cadoru
    [Documentation]    Выполнение тестового задания Альтатек
    YaTurKEY.Show All Title Region
    YaTurKEY.Check Count Regions
    YaTurKEY.Check Description
