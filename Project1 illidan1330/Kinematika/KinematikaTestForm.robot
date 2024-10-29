*** Settings ***
Documentation    Тест ввода данных на этапе оформления заказа
Library    SeleniumLibrary
Resource    KinematikaKW.resource
Suite Setup    web.Precondition: Open Browser And Maximize    SITE_URL=${SITE_URL}    BROWSER=${BROWSER}
Suite Teardown    web.Postcondition: Close Browser


*** Test Cases ***
Open Data Form
    [Documentation]    Открыть форму заполнения данных заказа
    KinematikaKW.Click Gift Sertificate
    KinematikaKW.Add 1500 Gift Sertificate To Basket
    KinematikaKW.Open Basket
    KinematikaKW.Open Data Form

Input Data
    [Documentation]    Заполнение формы
    KinematikaKW.Input Name
    KinematikaKW.Input EMail
    KinematikaKW.Input Phone
    KinematikaKW.Input TG
    KinematikaKW.Click Self Pickup
    KinematikaKW.Click Delivery Yandex
    KinematikaKW.Click EMAIL Delivery
    KinematikaKW.Input Location
    KinematikaKW.Input Code
    KinematikaKW.Input Comment
