*** Settings ***
Library    ../../utils/PegaUtil.py
Library    SeleniumLibrary    timeout=60
Resource    InteractionPortal.robot

*** Variables ***
${PEGA_URL}    ${EMPTY}
${PEGA_DEV}    https://cwt-cwtcxp-dt1.pegacloud.net/prweb
${loc_userid}    css=#txtUserID
${loc_password}    css=#txtPassword
${loc_login_button}    css=#sub.loginButton

*** Keywords ***   
User "${username}" is in CWT Portal
    Open Browser    ${PEGA_DEV}    gc
    Maximize Browser Window
    Wait Until Element Is Visible    ${loc_userid}    
    Input Text    ${loc_userid}    ${username}
    ${usr_password}    Set Variable If    "${username}" == "TrafficManager1"    Rules@1234    Cwt@12345
    Input Text    ${loc_password}    ${usr_password}
    Click Element    ${loc_login_button}
    Wait Until Element Is Visible    ${cxp_framework_logo}
    Wait Until Element Is Visible    //div[@class="dc-main"]
    Wait Until Page Is Loaded
    ${cxp_framework_label}    Set Variable If    "${username}" == "TrafficManager1"    CUSTOMER SERVICE    CXP FRAMEWORK FOR QA
    # Element Text Should Be    ${cxp_framework_logo}//span    ${cxp_framework_label}