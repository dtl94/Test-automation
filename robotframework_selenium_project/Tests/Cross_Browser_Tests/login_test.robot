*** Settings ***
Documentation    Test login functionality
Resource         ../../Resources/Keywords/common.robot
Resource         ../../PageObjects/login_page.robot
Resource         ../../Config/variables.robot
Resource         ../../Config/locators.robot
Resource         ../../Config/browser_config.robot

Suite Setup    Open Browser To Login Page   ${BASE_URL}${LOGIN_INDEX}    ${BROWSER}    remote_url=${HUB_URL}
Suite Teardown    Close Browser

*** Test Cases ***
Valid User Login
    Verify Login Page
    Input Username     ${VALID_USERNAME}
    Input Password     ${VALID_PASSWORD}
    Submit Login
    Verify Successful Login