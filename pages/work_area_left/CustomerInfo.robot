*** Settings ***
Library    SeleniumLibrary    timeout=30
Library    ../../utils/PegaUtil.py
Library    ../../utils/XpathUtil.py
Library    ../../utils/EmailUtil.py
Library    DateTime
Variables    CustomerInfo.py

*** Keywords ***
Customer Info Card is displayed
    Switch To Active Frame
    Wait Until Element Is Visible    ${customer_info_card}
    Element Should Be Visible    ${customer_icon}
    Element Should Be Visible    ${button_add_task}
    Element Should Be Visible    ${button_wrap_up}
    Element Should Be Visible    ${elapsed_time}
    Element Should Be Visible    ${goal_time}
    Element Text Should Be    ${button_add_task}    Add Task
    Element Text Should Be    ${button_wrap_up}    Wrap Up

Elapsed time in Service Level Timer is "${expected_goal_time}"
    ${current_elapsed_time}    Get Text    ${elapsed_time}
    ${actual_goal_time}    Get Text    ${goal_time}
    Should Be Equal As Strings    ${actual_goal_time}    ${expected_goal_time}
    ${converted_goal_time}    Convert Time    ${actual_goal_time}
    ${converted_elapsed_time}    Convert Time    ${current_elapsed_time}
    Should Be True    ${converted_goal_time} >= ${converted_elapsed_time}
    
Verify Customer Info Card details are correct "${full_name}", "${client}", "${email}", "${phone_number}", "${arranger}"
    Switch To Active Frame
    Wait Until Element Is Visible    ${customer_info_card}
    # Run Keyword If    "${arranger}" != "${EMPTY}"    Element Text Should Be    ${customer_arranger}    ${arranger}
    Element Text Should Be    ${customer_full_name}    ${full_name}
    # Element Text Should Be    ${customer_client}    ${client}
    Element Text Should Be    ${customer_email}    ${email}
    Element Text Should Be    ${customer_phone_number}    ${phone_number}