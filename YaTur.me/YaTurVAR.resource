*** Settings ***
Documentation    Глобальные для работы с сайтом YaTur
Library    SeleniumLibrary    # Подключаем библиотеку Selenium


*** Variables ***
${SITE_URL}            https://yatur.me/
${BROWSER}             edge
${ALL_REGION}    //div[@class="popup-list-header__opener-toggle"]
${REGIONS}    //li[@class="card-region__item"]
${SHOW_MORE}    //div[@class="area__popup-text-opener"]
