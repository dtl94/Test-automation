*** Settings ***
Library    SeleniumLibrary
Resource         ../Config/browser_config.robot
Resource         ../Config/locators.robot
Resource         ../Resources/Keywords/common.robot
Resource         ../login_page.robot

*** Keywords ***
Verify Home Page
    Run Keyword And Continue On Failure     Wait Until Element Is Visible    ${USER_DROPDOWN}

Verify Upgrade
    Run Keyword And Continue On Failure     Element Should Be Visible   ${UPGRADE_BUTTON}

Verify Dashboard
    Run Keyword And Continue On Failure     Element Should Be Visible   ${DASHBOARD_TITLE}
    ${text}=    Get Text    ${DASHBOARD_TITLE}
    Run Keyword And Continue On Failure     Should Be Equal    ${text}    Dashboard
    Run Keyword And Continue On Failure     Element Should Be Visible   ${DASHBOARD_TIMEATWORK}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${DASHBOARD_LATESTPOSTS}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${DASHBOARD_ACTIONS}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${DASHBOARD_QUICKLAUNCH}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${DASHBOARD_LATESTPOSTS}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${DASHBOARD_EMPLOYEESLEAVE}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${DASHBOARD_EMPLOYEEDISTRIBUTION}

Verify Side Bar
    Run Keyword And Continue On Failure     Element Should Be Visible   ${SIDEBAR_BANNER}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${SIDEBAR_SEARCH}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${SIDEBAR_ADMIN}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${SIDEBAR_PIM}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${SIDEBAR_LEAVE}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${SIDEBAR_RECRUITEMENT}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${SIDEBAR_MYINFO}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${SIDEBAR_PERFORMANCE}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${SIDEBAR_DASHBOARD}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${SIDEBAR_DIRECTORY}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${SIDEBAR_MAINTENANCE}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${SIDEBAR_CLAIM}
    Run Keyword And Continue On Failure     Element Should Be Visible   ${SIDEBAR_BUZZ}

Logout User
    Click Element   ${USER_DROPDOWN}
    Click Element   ${LOGOUT_BUTTON}
    Verify Login Page