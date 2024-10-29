*** Settings ***
Documentation    Переменные для работы с сайтом Кинематика
Library    SeleniumLibrary


*** Variables ***
${SITE_URL}    https://kinematika.cc/
${BROWSER}     edge
${GIFT_SERTIFICATE}    //div[text()="GIFT CARD"]
${1500_SERTIFICATE}    (//span[text()="1500"])[2]
${3000_SERTIFICATE}    (//span[text()="3000"])[2]
${5000_SERTIFICATE}    (//span[text()="5000"])[2]
${ADD_TO_BASKET}    //a[@class="t-store__prod-popup__btn t-btn t-btn_sm"]
${BASKET}    //div[@class="t706__carticon t706__carticon_sm t706__carticon_showed"]
${PLACE_ORDER}    (//button[text()="Оформить заказ"])[2]
${INPUT_NAME}    //*[@id="input_5733244879700"]
${NAME}    Геральт из Ривии
${INPUT_EMAIL}    //*[@id="input_5733244879701"]
${EMAIL}    PlotvaKurwa@wolf.pl
${INPUT_PHONE}    //*[@id="input_5733244879702"]
${PHONE}    9774442233
${INPUT_TG}    //*[@id="input_1718179822965"]
${TG}    @GwintKing
${INPUT_LOCATION}    //*[@id="input_1713812549615"]
${LOCATION}    Туссент, Корво Бьянко
${INPUT_CODE}    //input[@class="t-input t-inputpromocode js-tilda-rule"]
${CODE}    WITCHER
${INPUT_COMMENT}    //*[@id="input_1713874740957"]
${COMMENT}    Последние потерял в портале...Ненавижу, зараза, порталы...
${RADIO_BTN_1}    (//label[@class="t-radio__control t-text t-text_xs"])[1]
${RADIO_BTN_2}    (//label[@class="t-radio__control t-text t-text_xs"])[2]
${RADIO_BTN_3}    (//label[@class="t-radio__control t-text t-text_xs"])[3]
