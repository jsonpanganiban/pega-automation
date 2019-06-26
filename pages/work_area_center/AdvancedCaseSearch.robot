*** Settings ***
Library    SeleniumLibrary    timeout=30
Library    Collections
Library    String
Library    ../../utils/PegaUtil.py
Library    ../../utils/XpathUtil.py
Library    ../../utils/AssertionUtil.py
Resource   ../../pages/base/InteractionPortal.robot
Variables    AdvancedCaseSearch.py

*** Keywords ***   
the Search button is clicked
    Switch To Active Frame
    Wait Until Element Is Visible    ${search_button}
    Click Element    ${search_button}
    Wait Until Element Is Visible    ${grid_table}    

User is in Advanced Case Search Landing Page
    User selects menu item "Advanced Case Search"
    Switch To Active Frame
    Wait Until Element Is Visible    ${advanced_case_search_label}

Clear advanced case search
    ${clear_button}    Get Button By Text Xpath    Clear
    Click Element    ${clear_button}
    Wait Until Doc State Is Ready
    Element Text Should Be    ${created_on_from}    ${EMPTY}
    Element Text Should Be    ${created_on_to}    ${EMPTY}
    Element Text Should Be    ${closed_on_from}    ${EMPTY}
    Element Text Should Be    ${closed_on_to}    ${EMPTY}
    Element Text Should Be    ${last_updated_on_from}    ${EMPTY}
    Element Text Should Be    ${last_updated_on_to}    ${EMPTY}
    # TODO:
    # @{search_fields}    Create List    Case ID    Traveller Name    To email address    From Email Address    Subject of Email
    # :FOR    ${field_name}    IN    @{search_fields}
    # \    ${field}    Get Advance Case Search Xpath    ${field_name}
    # \    Element Text Should Be    ${field}    ${EMPTY}
    [Teardown]    Reload Page
        
column "${column_name}" is sorted by default
    ${is_descending}    Run Keyword And Return Status    search results are sorted by "${column_name}" in "Descending" order
    Run Keyword If    not ${is_descending}    column "${column_name}" is sorted        
        
column "${column_name}" is filtered by "${case_id}"
    the Search button is clicked   
    ${column}    Get Result Table Header Filter Xpath    ${column_name}
    Wait Until Element Is Visible    ${column}    
    Click Element    ${column}
    Wait Until Busy Indicator Is Completed
    Wait Until Element Is Visible    ${column_clear_filter}
    Input Text    ${search_text}    ${case_id}
    ${apply_button}    Get Button By Text Xpath    Apply
    Click Element    ${apply_button}
    
search results are filtered by "${filter_criteria}" under column "${column}"
    Switch To Active Frame
    Wait Until Busy Indicator Is Completed
    Run Keyword If    "${column}" == "Case ID"    verify filtered search result for Case ID ${filter_criteria} 
    ...    ELSE IF    "${column}" == "To email address"    verify filtered search result for email address ${filter_criteria} on column ${column}

verify filtered search result for Case ID ${filter_criteria}
    Element Should Be Visible    //tr[@oaargs="CWT-FW-CXP-WORK-INTERACTION ${filter_criteria}"]

verify filtered search result for email address ${email_address} on column ${column}
    @{email_elems}    Get Column Data    ${column}
    Should Not Be Empty    ${email_elems}
    ${is_email_identical}    Is List Values Identical    ${email_address}    ${email_elems}
    Should Be True    ${is_email_identical}    msg=Email address on column "${column}" should be "${email_address}"

column "${column_name}" is sorted
    ${column}    Get Result Table Header Xpath    ${column_name}
    Click Element    ${column}
    
search results are sorted by "${column_name}" in "${order}" order
    ${actual_result}    Get Column Data    ${column_name}
    Should Not Be Empty    ${actual_result}
    ${is_ascending}    Is Order Ascending    ${actual_result}
    ${expected_order}    Set Variable If    "${order}" == "Ascending"    ${True}    ${False}
    Should Be Equal    ${is_ascending}    ${expected_order}

searching case using "${search_criteria}" From "${date_from}" To "${date_to}"
    ${date_to}    Set Variable If    "${date_to}" == "${date_from}"    ${EMPTY}    ${date_to}
    ${from}    Set Variable If    "${search_criteria}" == "Created on"    ${created_on_from}
    ...    "${search_criteria}" == "Closed on"    ${closed_on_from}
    ...    "${search_criteria}" == "Updated on"    ${last_updated_on_from}       
    ${to}    Set Variable If    "${search_criteria}" == "Created on"    ${created_on_to}
    ...    "${search_criteria}" == "Closed on"    ${closed_on_to}
    ...    "${search_criteria}" == "Updated on"    ${last_updated_on_to}
    Wait Until Element Is Visible    ${from}
    Input Text    ${from}    ${date_from}
    Input Text    ${to}    ${date_to}
    Click Element    ${search_button}
    ${column_data}    Get Result Table Data Xpath    ${search_criteria}
    Wait Until Page Is Loaded
    ${date_from}    Replace String    ${date_from}    20    ${EMPTY}
    Wait Until Element Is Visible    ${column_data}//span[contains(text(), "${date_from}")]
    
searching case using "${input}" via "${search_criteria}"
    ${field}    Get Advance Case Search Xpath    ${search_criteria}
    Input Text    ${field}     ${input}
    
cases with corresponding "${search_criteria}" "${value}" are returned correctly
    @{column_data}    Get Column Data    ${search_criteria}
    Should Not Be Empty    ${column_data}
    ${is_date}    Run Keyword And Return Status    Should Match Regexp    ${value}    ^\\d+\\/\\d+\\/20\\d+$    
    ${value}    Run Keyword If    ${is_date}    Replace String    ${value}    20    ${EMPTY}    ELSE    Set Variable    ${value}
    :FOR    ${data}    IN    @{column_data}
    \    Should Contain   ${data}    ${value}    ignore_case=True    
    # ${is_identical}    Is List Values Identical    ${date_from}    ${column_data}
    # Should Be True    ${is_identical}
    
Get Column Data
    [Arguments]    ${column_name}
    Switch To Active Frame
    ${column_data}    Get Result Table Data Xpath    ${column_name}
    @{column_data_elems}    Get WebElements    ${column_data}
    @{actual_column_data}    Create List
    :FOR    ${elem}    IN    @{column_data_elems}
    \    ${elem_text}    Get Text    ${elem}
    \    Append To List    ${actual_column_data}    ${elem_text}
    Remove Values From List    ${actual_column_data}    ${EMPTY}
    Log List    ${actual_column_data}
    [Return]    ${actual_column_data}

number of results per page is 20
    ${column_data}    Get Result Table Data Xpath    Case ID
    @{column_data_elems}    Get WebElements    ${column_data}
    Length Should Be    ${column_data_elems}    20
    
"${case_status}" is selected from "Case Status" field
    Select From List By Value    ${case_status_dropdown}   ${case_status}