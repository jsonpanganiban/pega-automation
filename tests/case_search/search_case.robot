*** Settings ***
Resource   ../../pages/base/Login.robot
Resource   ../../pages/work_area_center/AdvancedCaseSearch.robot

Suite Setup    User "JesseCruz" is in CWT Portal
# Suite Teardown    Logout From Pega    

Test Teardown    Clear advanced case search

*** Test Cases ***
Scenario: Results per page
    Given User is in Advanced Case Search Landing Page
    When the Search button is clicked
    Then number of results per page is 20
    
# Scenario: Number of pages
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # Then search results page count is 10
    
Scenario: Search using Created on
    Given User is in Advanced Case Search Landing Page
    When searching case using "Created on" From "4/24/2019" To "4/25/2019"
    Then cases with corresponding "Created on" "4/24/2019" are returned correctly

# Scenario: Search using Closed on
    # Given User is in Advanced Case Search Landing Page
    # When searching case using "Closed on" From "4/26/2019" To "4/26/2019"
    # Then cases with corresponding "Closed on" "4/24/2019" are returned correctly
        
Scenario: Search using Last updated on
    Given User is in Advanced Case Search Landing Page
    When searching case using "Updated on" From "4/30/2019" To "4/30/2019"
    Then cases with corresponding "Updated on" "4/30/2019" are returned correctly

Scenario: Search using Open Case Status
    Given User is in Advanced Case Search Landing Page
    When "Open" is selected from "Case Status" field
    And the Search button is clicked
    Then cases with corresponding "Case Status" "Open" are returned correctly 

Scenario: Search using Resolved-Authorization Case Status
    Given User is in Advanced Case Search Landing Page
    When "Resolved-Authorization" is selected from "Case Status" field
    And the Search button is clicked
    Then cases with corresponding "Case Status" "Resolved-Authorization" are returned correctly 

Scenario: Search using Resolved-Unwanted Case Status
    Given User is in Advanced Case Search Landing Page
    When "Resolved-Unwanted" is selected from "Case Status" field
    And the Search button is clicked
    Then cases with corresponding "Case Status" "Resolved-Unwanted" are returned correctly     
    
# # No data
# Scenario: Search New Case Status
    # Given User is in Advanced Case Search Landing Page
    # When "New" is selected from "Case Status" field
    # And the Search button is clicked
    # Then cases with corresponding "Case Status" "New" are returned correctly 
    
# Scenario: Search using Resolved-Autoreply Case Status
    # Given User is in Advanced Case Search Landing Page
    # When "Resolved-Autoreply" is selected from "Case Status" field
    # And the Search button is clicked
    # Then cases with corresponding "Case Status" "Open" are returned correctly     

# Scenario: Search using Resolved-Completed Case Status
    # Given User is in Advanced Case Search Landing Page
    # When "Resolved-Completed" is selected from "Case Status" field
    # And the Search button is clicked
    # Then cases with corresponding "Case Status" "Open" are returned correctly     
    
# Scenario: Search using N/A Case Status
    # Given User is in Advanced Case Search Landing Page
    # When "N/A" is selected from "Case Status" field
    # And the Search button is clicked
    # Then cases with corresponding "Case Status" "Open" are returned correctly     
    
Scenario: Search using partial Case ID
    Given User is in Advanced Case Search Landing Page
    When searching case using "I-469" via "Case ID"
    And the Search button is clicked
    Then cases with corresponding "Case ID" "I-469" are returned correctly 

Scenario: Search using To Email Address
    Given User is in Advanced Case Search Landing Page
    When searching case using "Pegatest7@contactcwt.com" via "To email address"
    And the Search button is clicked
    Then cases with corresponding "To email address" "Pegatest7@contactcwt.com" are returned correctly 

Scenario: Search using partial To Email Address
    Given User is in Advanced Case Search Landing Page
    When searching case using "Pegatest7" via "To email address"
    And the Search button is clicked
    Then cases with corresponding "To email address" "Pegatest7" are returned correctly

Scenario: Search using From Email Address
    Given User is in Advanced Case Search Landing Page
    When searching case using "James.Toplis@carlsonwagonlit.com" via "From Email Address"
    And the Search button is clicked
    Then cases with corresponding "From Email Address" "James.Toplis@carlsonwagonlit.com" are returned correctly 

Scenario: Search using partial From Email Address
    Given User is in Advanced Case Search Landing Page
    When searching case using "James.Toplis" via "From Email Address"
    And the Search button is clicked
    Then cases with corresponding "From Email Address" "James.Toplis" are returned correctly
    
#Subject of Email
Scenario: Search using Subject of Email
    Given User is in Advanced Case Search Landing Page
    When searching case using "test" via "Subject of Email"
    And the Search button is clicked
    Then cases with corresponding "Subject of Email" "test" are returned correctly
        
Scenario: Search using partial Subject of Email
    Given User is in Advanced Case Search Landing Page
    When searching case using "Scenario 2 " via "Subject of Email"
    And the Search button is clicked
    Then cases with corresponding "Subject of Email" "Scenario 2" are returned correctly
        
# Scenario: Search using Traveller Name
    # Given User is in Advanced Case Search Landing Page
    # When searching case using "James Toplis" via "Traveller Name"
    # And the Search button is clicked
    # Then cases with corresponding "To email address" "James.Toplis" are returned correctly
        
# Scenario: Search using partial Traveller Name
    # Given User is in Advanced Case Search Landing Page
    # When "Te" is entered in "Traveller Name" field
    # And the Search button is clicked
    # Then cases with corresponding "Traveller Name" value are returned correctly
    
# #Email Body
# Scenario: Search using Email Body
    # Given User is in Advanced Case Search Landing Page
    # When "Test" is entered in "Email Body" field
    # And the Search button is clicked
    # Then cases with corresponding "Email Body" value are returned correctly
    
# Scenario: Search using partial Email Body
    # Given User is in Advanced Case Search Landing Page
    # When "Te" is entered in "Email Body" field
    # And the Search button is clicked
    # Then cases with corresponding "Email Body" value are returned correctly