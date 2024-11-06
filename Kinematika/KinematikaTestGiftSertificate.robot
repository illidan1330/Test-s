*** Settings ***
Documentation    Тест добавления сертификатов в корзину
Library          SeleniumLibrary
Resource         KinematikaKW.resource
Test Setup       web.Precondition: Open Browser And Maximize    SITE_URL=${SITE_URL}    BROWSER=${BROWSER}
Test Teardown    web.Postcondition: Close Browser


*** Test Cases ***
Add Gift Sertificate to Basket
    [Documentation]    Добавление сертификатов в корзину
    KinematikaKW.Click Gift Sertificate
    KinematikaKW.Add 1500 Gift Sertificate To Basket
    KinematikaKW.Click Gift Sertificate
    KinematikaKW.Add 3000 Gift Sertificate To Basket
    KinematikaKW.Click Gift Sertificate
    KinematikaKW.Add 5000 Gift Sertificate To Basket
    KinematikaKW.Open Basket
