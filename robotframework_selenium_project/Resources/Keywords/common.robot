Library    SeleniumLibrary
Library    Collections

*** Keywords ***
Open Browser With Options
    [Arguments]    ${url}    ${browser}     ${remote_url}
    ${options}=    Get Browser Options    ${browser}
    Create Webdriver    Remote
    ...    command_executor=${remote_url}
    ...    options=${options}
    Go To    ${url}
    Set Selenium Implicit Wait    10 seconds
    Maximize Browser Window

Get Browser Options
    [Arguments]    ${browser}
    IF    "${BROWSER}" == "chrome"
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
        Call Method    ${options}    add_argument    --no-sandbox
        Call Method    ${options}    add_argument    --disable-dev-shm-usage
        Call Method    ${options}    add_argument    --disable-gpu
        Call Method    ${options}    add_argument    --headless
    ELSE IF    "${BROWSER}" == "firefox"
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys
        Call Method    ${options}    add_argument    --headless
    END
    RETURN    ${options}

Close Browser
    Close All Browsers