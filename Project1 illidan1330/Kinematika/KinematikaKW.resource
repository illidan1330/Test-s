*** Settings ***
Documentation    Кейворды для сайта Кинематика
Resource    ../web.resource
Resource    KinematikaVR.resource
Library    SeleniumLibrary


*** Keywords ***
Click Gift Sertificate
    [Documentation]    Открыть карточку товара "Подарочные сертификаты"
    Wait Until Element Is Visible    locator=${GIFT_SERTIFICATE}
    Scroll Element Into View    locator=${GIFT_SERTIFICATE}
    Click Element    locator=${GIFT_SERTIFICATE}

Add 1500 Gift Sertificate To Basket
    [Documentation]    Добавление сертификата на 1500 рублей в корзину
    Wait Until Element Is Visible    locator=${1500_SERTIFICATE}
    Click Element    locator=${1500_SERTIFICATE}
    Click Element    locator=${ADD_TO_BASKET}

Add 3000 Gift Sertificate To Basket
    [Documentation]    Добавление сертификата на 3000 рублей в корзину
    Wait Until Element Is Visible    locator=${3000_SERTIFICATE}
    Click Element    locator=${3000_SERTIFICATE}
    Click Element    locator=${ADD_TO_BASKET}

Add 5000 Gift Sertificate To Basket
    [Documentation]    Добавление сертификата на 5000 рублей в корзину
    Wait Until Element Is Visible    locator=${5000_SERTIFICATE}
    Click Element    locator=${5000_SERTIFICATE}
    Click Element    locator=${ADD_TO_BASKET}

Open Basket
    [Documentation]    Открыть корзину
    Wait Until Element Is Visible    locator=${BASKET}
    Click Element    locator=${BASKET}

Open Data Form
    [Documentation]    Открыть форму заполнения данных для заказа
    Wait Until Element Is Visible    locator=${PLACE_ORDER}
    Click Element    locator=${PLACE_ORDER}

Input Name
    [Documentation]    Ввод имени
    Input Text    locator=${INPUT_NAME}    text=${NAME}

Input EMail
    [Documentation]    Ввод электронной почты
    Input Text    locator=${INPUT_EMAIL}    text=${EMAIL}

Input Phone
    [Documentation]    Ввод номера телефона
    Input Text    locator=${INPUT_PHONE}    text=${PHONE}

Input TG
    [Documentation]    Ввод телеграмма
    Input Text    locator=${INPUT_TG}    text=${TG}

Input Location
    [Documentation]    Ввод адреса
    Input Text    locator=${INPUT_LOCATION}    text=${LOCATION}

Input Code
    [Documentation]    Вввод промокода
    Input Text    locator=${INPUT_CODE}    text=${CODE}

Input Comment
    [Documentation]    Ввод комментария
    Input Text    locator=${INPUT_COMMENT}    text=${COMMENT}

Click Self Pickup
    [Documentation]    Выбор самовывоза радиоточки
    Click Element    locator=${RADIO_BTN_1}
    Sleep    time_=0.3s

Click Delivery Yandex
    [Documentation]    Выбор Доставку ПВЗ Яндекс
    Click Element    locator=${RADIO_BTN_2}
    Sleep    time_=0.3s

Click EMAIL Delivery
    [Documentation]    Выбор доставки на электронную почту
    Click Element    locator=${RADIO_BTN_3}
    Sleep    time_=0.3s
