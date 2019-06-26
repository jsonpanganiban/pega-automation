*** Settings ***
Library    SeleniumLibrary    timeout=30
Library    Collections
Library    ../../utils/PegaUtil.py
Library    ../../utils/XpathUtil.py
Variables    InteractionPortal.py

*** Keywords ***
Close All Open Interaction Tabs
    Close All Tabs
    
Close Interaction Tab "${interaction_tab}"
    Switch To Default Content
    ${interaction_tab_elem}    Set Variable    //li[@title="${interaction_tab}"]${button_close_tab}
    Click Element    ${interaction_tab_elem}
    Wait Until Element Is Not Visible    ${interaction_tab_elem}   

Logout From Pega
    Close All Tabs
    Click Element    ${avatar_name}
    Wait Until Element Is Visible    ${logout}
    Click Element    ${logout}
    Run Keyword And Ignore Error    Handle Alert
    Wait Until Element Is Not Visible    ${cxp_framework_logo}    
    [Teardown]    Close Browser

User selects Interaction
    [Arguments]    ${interaction_type}    ${interaction_subtype}=${EMPTY}
    Switch To Default Content
    Wait Until Element Is Visible    ${interaction_portal_header}
    Set Focus To Element    ${interaction_portal_header}
    Wait Until Element Is Visible    ${new_button}
    Click Element    ${new_button}
    ${interaction_type}    Get Span By Text Xpath    ${interaction_type}
    ${interaction_type}    Set Variable    ${interaction_type}
    Wait Until Element Is Visible    ${interaction_type}
    Sleep    1
    Run Keyword If    "${interaction_subtype}" != "${EMPTY}"    Mouse Over    ${interaction_type}    ELSE    Click Element    ${interaction_type}
    Run Keyword If    "${interaction_subtype}" != "${EMPTY}"    Select Sub Interaction    ${interaction_subtype}
    
Select Sub Interaction
    [Arguments]     ${interaction_subtype}
    ${interaction_subtype}    Get Span By Text Xpath    ${interaction_subtype}
    Wait Until ELement Is Visible    ${interaction_subtype}
    Sleep    1
    Click Element    ${interaction_subtype}

My workbasket table is displayed
    Switch To Active Frame
    Wait Until Element Is Visible    ${user_work_list_section}
    Element Should Be Visible    ${my_workbasket_table}  

Navigation menuitems are displayed
    [Arguments]    @{expected_menu_items}
    Switch To Active Frame
    Wait Until Element Is Visible    ${menu_items_panel}
    @{menu_items_elems}    Get WebElements    ${menu_items}
    @{actual_menu_items}    Create List
    :FOR    ${item}    IN    @{menu_items_elems}
    \    ${item_title}    Get Element Attribute    ${item}    innerHTML
    \    Append To List    ${actual_menu_items}    ${item_title}
    Lists Should Be Equal    ${actual_menu_items}    ${expected_menu_items}
        
User selects menu item "${menu_item}"
    Switch To Active Frame
    ${menu_item_elem}    Get Menu Item Xpath    ${menu_item}
    Wait Until Element Is Visible    ${menu_item_elem}
    Click Element    ${menu_item_elem}
    Click Element    ${home_tab_main}

User navigates to work item "${work_item}"
    Switch To Active Frame    
    ${work_item}    Get Work Item Xpath    ${work_item}
    Wait Until Element Is Visible        ${work_item}
    Click Element    ${work_item}
    
User selects Workbasket item "${workbasket_item}"
    User selects menu item "My Work" 
    User navigates to work item "My workbaskets"
    Switch To Active Frame
    Wait Until Element Is Visible    ${view_queue_dropdown}
    Click Element    ${view_queue_dropdown}
    ${workbasket_item_elem}    Get Viewqueue Option Xpath    ${workbasket_item}
    Click Element    ${workbasket_item_elem}

User searches for Case "${case_id}"
    Switch To Active Frame
    Wait Until Element Is Visible    ${search_case_bar}
    Input Text    ${search_case_bar}    ${case_id}
    Click Element    ${search_icon}
    Wait Until Element Is Visible    ${my_workbasket_table}
    Scroll Element Into View    ${my_workbasket_table}    
    ${workbaskets}    Get Work Item Xpath    My workbaskets
    Click Element    ${workbaskets}

User selects Case "${case_id}"
    Switch To Active Frame
    Wait Until Element Is Visible    ${my_workbasket_table}
    ${case_item}    Get Case Item Xpath    ${case_id}
    Wait Until Element Is Visible    ${case_item}
    Click Element    ${case_item}

Verify Workbasket contains "${email_type}" cases
    ${case_id}    Get Variable Value    ${case_id}
    ${case_item}    Get Case Item Xpath    ${case_id}
    Element Should Be Visible    ${case_item}
    # TODO: Verify email type is displayed

Select Pega Tab
    [Arguments]    ${tab_name}
    Switch To Default Content
    ${tab}    Get Pega Tab Xpath    ${tab_name}  
    Click Element    ${tab}   