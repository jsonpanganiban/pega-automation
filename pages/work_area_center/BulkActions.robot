*** Settings ***
Library    SeleniumLibrary    timeout=60
Library    Collections
Library    ../../utils/PegaUtil.py
Library    ../../utils/XpathUtil.py
Resource    ../base/InteractionPortal.robot
Variables    BulkActions.py

*** Keywords ***   
User closes the bulk actions tab
    Switch To Active Frame
    Wait Until Element Is Not Visible    ${update_urgency_modal}
    ${bulk_action_close_button}    Get Button By Text Xpath    Close
    Wait Until Element Is Visible    ${bulk_action_close_button}
    Set Focus To Element    ${bulk_action_close_button}
    Click Element    ${bulk_action_close_button}
    [Teardown]    Reload Page
    
User navigates to Bulk Action
    User selects menu item "Manager Tools"
    Switch To Active Frame
    ${bulk_actions}    Get Button Pzbtnmid Xpath    Bulk actions
    Scroll Element Into View    ${bulk_actions}
    Wait Until Element Is Visible    ${bulk_actions}
    Click Element    ${bulk_actions}
    Wait Until Element Is Not Visible    ${bulk_actions}

User selects Workbasket item "${workbasket_item}" in Bulk Actions tab
    Switch To Active Frame
    Wait Until Element Is Visible    ${bulk_actions_view_queue_dropdown}
    Click Element    ${bulk_actions_view_queue_dropdown}
    ${workbasket_item_elem}    Get Viewqueue Bulk Action Xpath    ${workbasket_item}
    Click Element    ${workbasket_item_elem}

Update Urgency Is Selected
    Switch To Active Frame
    Wait Until Element Is Visible    ${bulk_actions_header}    
    ${update_urgency_button}    Get Button By Text Xpath    Update Urgency
    Wait Until Element Is Visible    ${update_urgency_button}
    Click Element    ${update_urgency_button}
    
Update Urgency Value and Reason
    [Arguments]    ${new_urgency}    ${update_reason}
    Update Urgency Is Selected
    Wait Until Element Is Visible    ${update_urgency_modal}
    Input Text    ${urgency_value_textbox}    ${new_urgency}
    Click Element    ${urgency_update_reason_dropdown}
    ${update_reason_item}    Get Urgency Update Reason Xpath    ${update_reason}
    Wait Until Element Is Visible    ${update_reason_item}
    Click Element    ${update_reason_item}
    Click Element    ${submit_new_urgency_button}

User updates multiple cases to "${new_urgency}" and reason to "${update_reason}"
    Switch To Active Frame
    ${record_length}    Get Element Attribute    //div[@data-node-id="pyBulkProcessingSearch"] //div[@id="PEGA_GRID_CONTENT" and @currentpageindex="1"]    totalrecords
    ${checkbox_to_tick}    Set Variable If    ${record_length} > 5    5    ${record_length}
    Set Test Variable    ${checkbox_to_tick}
    :FOR    ${i}    IN RANGE    1    ${checkbox_to_tick} + 1
    \    ${i}    Convert To String    ${i}
    \    ${case_urgency_checkbox}    Get Case Urgency Checbox Xpath    ${i}
    \    Wait Until Element Is Visible    ${case_urgency_checkbox}
    \    Click Element    ${case_urgency_checkbox}
    Update Urgency Value and Reason    ${new_urgency}    ${update_reason}
    
User updates case id "${case_id}" urgency to "${new_urgency}" and reason to "${update_reason}"
    Switch To Active Frame
    ${case_id_checkbox}    Get Case Id Checkbox Xpath    ${case_id}
    Wait Until Element Is Visible    ${case_id_checkbox}
    Click Element    ${case_id_checkbox}
    Update Urgency Value and Reason    ${new_urgency}    ${update_reason}
    
Verify case id "${case_id}" urgency is "${expected_urgency}"
    Switch To Active Frame
    ${new_case_urgency}    Get Urgency Value Xpath    ${case_id}
    Wait Until Page Contains    ${case_id}
    Element Text Should Be        ${new_case_urgency}    ${expected_urgency}    

Verify urgency of updated cases are "${expected_urgency}"
    Switch To Active Frame
    ${checkbox_to_verify}    Get Variable Value   ${checkbox_to_verify}    5
    :FOR    ${i}    IN RANGE    1    ${checkbox_to_verify} + 1
    \    ${i}    Convert To String    ${i}
    \    ${case_urgency_value}    Get Case Urgency Via Row Xpath    ${i}
    \    Wait Until Element Is Visible    ${case_urgency_value}
    \    Element Text Should Be        ${case_urgency_value}    ${expected_urgency}

Bulk Urgency Update Error Message is prompt
    Wait Until Element Is Visible    ${update_urgency_modal}
    Element Text Should Be    ${update_urgency_error_message}    Please select at least one case for update
    ${close_modal}    Get Button By Title Xpath    close modal
    Click Element    ${close_modal}