*** Settings ***
Documentation    Verify Home Page Elements
Resource         ../../Resources/Keywords/common.robot
Resource         ../../Resources/Keywords/login_keywords.robot
Resource         ../../PageObjects/login_page.robot
Resource         ../../PageObjects/home_page.robot
Resource         ../../Config/variables.robot
Resource         ../../Config/locators.robot
Resource         ../../Config/browser_config.robot

Suite Setup    Open Browser To Login Page   ${BASE_URL}${LOGIN_INDEX}    ${BROWSER}    remote_url=${HUB_URL}
Suite Teardown    Close Browser

*** Test Cases ***
Home Page Test
    Connect User    ${VALID_USERNAME}   ${VALID_PASSWORD}
    Verify upgrade
    Verify Dashboard
    Verify Side Bar
    Logout User