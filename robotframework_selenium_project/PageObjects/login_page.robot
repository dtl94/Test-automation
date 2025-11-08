*** Settings ***
Library    SeleniumLibrary
Resource         ../Config/browser_config.robot
Resource         ../Config/locators.robot
Resource         ../Resources/Keywords/common.robot

*** Keywords ***
Open Browser To Login Page
    [Arguments]    ${url}    ${browser}     ${remote_url}
    Open Browser With Options    ${url}    ${browser}    ${remote_url}
    Maximize Browser Window

Verify Login Page
    Wait Until Element Is Visible    ${USERNAME_FIELD}

Input Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Submit Login
    Click Button    ${LOGIN_BUTTON}

Verify Successful Login
    Wait Until Element Is Visible    ${UPGRADE_BUTTON}
    Wait Until Element Is Visible    ${USER_DROPDOWN}