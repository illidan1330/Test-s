*** Settings ***
Documentation    Переменные для "Соус" сайта
Library    SeleniumLibrary


*** Variables ***
${SITE_URL}            https://www.saucedemo.com/
${BROWSER}             EDGE
${INPUT_LOGIN}         //*[@id="user-name"]
${INPUT_PASSWORD}      //*[@id="password"]
${LOGIN_BUTTON}        //*[@id="login-button"]
@{TRUE_LOGIN_LIST}
...                    standard_user
...                    locked_out_user
...                    problem_user
...                    performance_glitch_user
...                    error_user
...                    visual_user
${TRUE_LOGIN}          standard_user
${TRUE_PASSWORD}       secret_sauce
${INVALID_LOGIN}       InvalidLogin
${INVALID_PASSWORD}    InvalidPassword
# Якорная переменная по которой понимаем, что авторизованы
${ANCHORAUTH}          //*[@id="inventory_container"]
# Ошибка, что пользователь забанен
${BANNED_ERROR}        //*[text()="Epic sadface: Sorry, this user has been locked out."]
# Ошибка ввода логина или пароля
${ERROR1}              //*[text()="Epic sadface: Username and password do not match any user in this service"]
# Ошибка, введите имя пользователя
${ERROR2}              //*[text()="Epic sadface: Username is required"]
# Ошибка, введите пароль пользователя
${ERROR3}              //*[text()="Epic sadface: Password is required"]
