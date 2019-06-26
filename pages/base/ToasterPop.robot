*** Settings ***
Library    SeleniumLibrary    timeout=30
Library    ../../utils/PegaUtil.py
Library    ../../utils/XpathUtil.py
Variables    ToasterPop.py

*** Keywords ***   
Incoming call popup from "${caller}" is displayed
    Switch To Default Content
    Wait Until Element Is Visible    ${incoming_call_popup}
    Element Should Be Visible    ${incoming_call_label}
    Element Text Should Be    ${incoming_call_label}    ${caller}
      
Incoming call is accepted
    Wait Until Element Is Visible    ${accept_call_button}
    Click Button    ${accept_call_button}
    Wait Until Element Is Not Visible    ${accept_call_button}