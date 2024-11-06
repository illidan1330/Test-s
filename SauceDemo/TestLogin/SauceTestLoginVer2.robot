*** Settings ***
Documentation    Тестирование формы входа в аккаунт
Library    SeleniumLibrary
Resource    SauceLoginKEY.resource
Suite Setup    web.Precondition: Open Browser And Maximize    SITE_URL=${SITE_URL}    BROWSER=${BROWSER}
Test Teardown    web.Refresh Current Page
Suite Teardown    web.Postcondition: Close Browser


*** Test Cases ***
Authorization With True Login And True Password
    [Documentation]    Авторизация при помощи вылидных данных
    SauceLoginKEY.Authorization With True Login And True Password

Authorization With True Login And With False Password
    [Documentation]    Авторизация при помощи существующего логина и несуществующего пароля
    SauceLoginKEY.Authorization With True Login And With False Password

Authorization With True Login Without Password
    [Documentation]    Авторизация при помощи существующего логина и без пароля
    SauceLoginKEY.Authorization With True Login And Without Password

Authorization With False Login And True Password
    [Documentation]    Авторизация при помощи несуществующего логина и существующего пароля
    SauceLoginKEY.Authorization With False Login And True Password

Authorization With False Login And False Password
    [Documentation]    Автооризация при помощи несуществующих логина и пароля
    SauceLoginKEY.Authorization With False Login And False Password

Authorization With False Login And Without Password
    [Documentation]    Авторизация при помощи несущестующего логина и без пароля
    SauceLoginKEY.Authorization With False Login And Without Password

Authorization Without Login And With True Password
    [Documentation]    Авторизация без логина и при помощи существующего пароля
    SauceLoginKEY.Authorization Without Login And With True Password

Authorization Without Login And With False Password
    [Documentation]    Авторизация без логина и при помощи несуществующего пароля
    SauceLoginKEY.Authorization Without Login And With False Password

Authorization Without Login And Without Password
    [Documentation]    Авторизация без ввода логина и пароля
    SauceLoginKEY.Authorization Without Login And Without Password
