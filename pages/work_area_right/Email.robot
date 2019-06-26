*** Settings ***
Library    String
Library    SeleniumLibrary    timeout=30
Library    ../../utils/PegaUtil.py
Library    ../../utils/XpathUtil.py
Library    ../../utils/EmailUtil.py
Variables    Email.py

*** Keywords ***
Verify Email Details are correct "${subject}", "${from}", "${to}"
    Switch To Active Frame
    Wait Until Element Is Visible    ${email_header}
    Element Text Should Be    ${email_subject}    ${subject}
    Element Text Should Be    ${email_from}    ${from}
    Element Text Should Be    ${email_to}    ${to}

Verify Email Category is "${category}"
    Switch To Default Content
    Wait Until Element Is Visible    ${email_header}
    ${email_category}    Get Email Category Xpath    ${category}
    Element Should Be Visible    ${email_category}
    
Verify Email Sentiment is "${sentiment}"
    Switch To Default Content
    Wait Until Element Is Visible    ${email_header}
    ${email_sentiment}    Get Email Sentiment Xpath    ${sentiment}
    Element Should Be Visible    ${email_sentiment}

Verify Email Status is "${status}"
    Switch To Default Content
    Wait Until Element Is Visible    ${email_header}
    ${email_status}    Get Email Status Xpath    ${status}
    Element Should Be Visible    ${email_status}
    
Email that "${condition}" "${subject}" from "${sender}" to "${recipient}" is received
    Send Email    ${sender}    ${subject}    ${recipient}

CaseId is retrieved from Inbox   
    [Arguments]    ${sender}    ${recipient}    ${username}    ${password}
    Sleep    3m
    Connect To Exchange    webmail.nv.carlsonwagonlit.com    ${recipient}    ${username}    ${password}
    ${case_id}    Get Recent Caseid    ${sender}
    Set Test Variable    ${case_id}
    [Return]    ${case_id}
