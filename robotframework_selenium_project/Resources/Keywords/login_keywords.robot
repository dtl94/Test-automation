*** Settings ***
Library    SeleniumLibrary
Resource         ../../PageObjects/login_page.robot

*** Keywords ***
Connect User
    [Arguments]    ${username}    ${password}
    Input Username     ${username}
    Input Password     ${password}
    Submit Login