*** Settings ***
Documentation    Переменные для ФедотовГруп
Library    SeleniumLibrary


*** Variables ***
${SITE_URL}    https://fedotov.group/articles
${BROWSER}    edge
# Кнопка "Загрузить еще"
${SHOW_MORE}    //div[@class="t-feed__button-container"]
${SHOW_MORE_MODULE}    //div[@class="t-feed__buttons-wrapper t-container"]
${BLOCK_PANEL}    //li[@class="js-feed-parts-switcher t-feed__parts-switch-btn t-feed__parts-switch-btn_bg t-name t-name_xs t-menu__link-item"]
${BLOCK_LEGISLATION}    //a[text()="Законодательство"]
