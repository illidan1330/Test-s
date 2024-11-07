*** Settings ***
Documentation    Тест Федотов Груп
Library    SeleniumLibrary
Resource    FedotovKEY.resource
Test Setup    web.Precondition: Open Browser And Maximize    SITE_URL=${SITE_URL}    BROWSER=${BROWSER}
Test Teardown    web.Postcondition: Close Browser


*** Test Cases ***
Verification Links In Articles
    [Documentation]    Проверка верности ссылок всех элементов
    FedotovKEY.Show All Elements In Block
    FedotovKEY.Click All Elements In Block
