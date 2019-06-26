*** Settings ***
Library    SeleniumLibrary    timeout=30
Library    ../../utils/PegaUtil.py
Library    ../../utils/XpathUtil.py
Library    Collections
Variables    TravellerInfo.py

*** Keywords ***   
User Selects "${account_number}" account for that Traveller
    ${select_account_label}    Get Menu Item Xpath    Select an account
    Wait Until Element Is Visible    ${select_account_label}
    ${account_number}    Get Account Number Xpath    ${account_number}
    Double Click Element    ${account_number}

User Starts searching for traveller using lastname "${lastname}"
    Switch To Active Frame
    Wait Until Element Is Visible    ${lastname_search}
    Input Text    ${lastname_search}    ${lastname}
    ${search_button}    Get Button By Title    Search
    Click ELement    ${search_button}

User selects Traveller "${traveller_name}"
    ${traveller_name}    Get Customer Match Xpath    ${traveller_name}
    Double Click Element    ${traveller_name}

Verify Traveller Details Are Correct "${last_name}", "${first_name}", "${phone_number}", "${email}", "${city}", "${state}"
    Switch To Active Frame
    ${search_result}    Get Menu Item Xpath    Customer matches
    Wait Until Element Is Visible    ${search_result}
    ${actual_last_name}    Get Result Column Xpath    Last name
    ${actual_first_name}    Get Result Column Xpath    First name
    ${actual_email}    Get Result Column Xpath    Email
    Element Text Should Be    ${actual_last_name}    ${last_name}    
    Element Text Should Be    ${actual_first_name}    ${first_name}
    Element Text Should Be    ${actual_email}    ${email}
    ${actual_phone_number}    Run Keyword If    "${phone_number}" != "${EMPTY}"    Get Result Column Xpath    Phone number
    Run Keyword If    "${phone_number}" != "${EMPTY}"    Element Text Should Be    ${actual_phone_number}    ${phone_number}
    ${actual_city}    Run Keyword If    "${city}" != "${EMPTY}"     Get Result Column Xpath    City
    Run Keyword If    "${city}" != "${EMPTY}"    Element Text Should Be    ${actual_city}    ${city}
    ${actual_state}    Run Keyword If    "${state}" != "${EMPTY}"    Get Result Column Xpath    State
    Run Keyword If    "${state}" != "${EMPTY}"    Element Text Should Be    ${actual_state}    ${state}
   
Verify Traveller Profile Notes
    [Arguments]    @{traveller_notes}
    Switch To Active Frame
    Wait Until Element Is Visible    ${profile_notes_label}
    @{profile_notes_elem}    Get WebElements    ${profile_notes_label}//div[contains(@class,"heading_6_dataLabelWrite")]/div
    @{actual_profile_notes}    Create List
    :FOR    ${notes}    IN    @{profile_notes_elem}
    \    ${notes_text}    Get Text    ${notes}
    \    Append To List    ${actual_profile_notes}    ${notes_text}
    Lists Should Be Equal    ${actual_profile_notes}    ${traveller_notes}
    
Traveller Dashboard Page For "${traveller_lastname}" is Displayed
    Switch To Active Frame
    Wait Until Element Is Visible    ${main_panel_header}
    ${expected_header_message}    Set Variable    Thank you for contacting U+Bank. How can I help you today, ${traveller_lastname}?
    Element Text Should Be    ${main_panel_header}    ${expected_header_message}

Personal Preferences Section Is Displayed
    [Arguments]    @{tab_list}
    Switch To Active Frame
    :FOR    ${tab}    IN    @{tab_list}
    \    Wait Until Element Is Visible    ${personal_preferences_section}
    \    ${tab_item}    Get Work Item Xpath    ${tab}
    \    Wait Until Element Is Visible    ${tab_item}
    \    Page Should Contain    ${tab}

User navigates to personal preferences tab "${tab_item}"
    Switch To Active Frame
    ${tab_item}    Get Work Item Xpath    ${tab_item}
    Wait Until Element Is Visible        ${tab_item}
    Click Element    ${tab_item}
    
Verify Details Displayed In The Preference Tab
    [Arguments]    @{tab_details_list}
    Switch To Active Frame
    Wait Until Element Is Visible    ${personal_preferences_tabs}
    :FOR    ${value}    IN    @{tab_details_list}
    \    Page Should Contain    ${value}    