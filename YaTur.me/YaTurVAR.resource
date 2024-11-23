*** Settings ***
Documentation    Глобальные для работы с сайтом YaTur
Library    SeleniumLibrary    # Подключаем библиотеку Selenium


*** Variables ***
${SITE_URL}            https://yatur.me/    # URL который открыть
${BROWSER}             edge    # Браузер в котором открыть страницу и проводить тест
${ALL_REGION}    //div[@class="popup-list-header__opener-toggle"]    # Xpath кнопки показать все регионы
${REGIONS}    //li[@class="card-region__item"]    # Xpath на все карточки регионов
${SHOW_MORE}    //div[@class="area__popup-text-opener"]    # Кнопка "Полное описание" на странице
