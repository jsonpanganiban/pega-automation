*** Settings ***
Resource   ../../pages/base/Login.robot
Resource   ../../pages/work_area_center/AdvancedCaseSearch.robot

Suite Setup    User "JesseCruz" is in CWT Portal
Suite Teardown    Logout From Pega    
Test Teardown    Clear advanced case search

*** Test Cases ***    
Scenario: Filter by Case ID
    Given User is in Advanced Case Search Landing Page
    When column "Case ID" is filtered by "I-4454"
    Then search results are filtered by "I-4454" under column "Case ID"
    
Scenario: Filter by To Email Address
    Given User is in Advanced Case Search Landing Page
    When column "To email address" is filtered by "Pegatest1@contactcwt.com"
    Then search results are filtered by "Pegatest1@contactcwt.com" under column "To email address"
    
# Scenario: Filter by From Email Address
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When column "From Email Address" is filtered by "jes"
    # Then search results are filtered by "From Email Address"
    
# Scenario: Filter by Subject of Email
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When column "Subject of Email" is filtered by "tes"
    # Then search results are filtered by "Subject of Email"
    
# Scenario: Filter by Created On
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When column "Created On" is filtered by "Current Day"
    # Then search results are filtered by "Created On"
    
# Scenario: Filter by Updated On
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When column "Updated On" is filtered by "Current Day"
    # Then search results are filtered by "Updated On"
    
# Scenario: Filter by Closed On
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When column "Closed On" is filtered by "Current Day"
    # Then search results are filtered by "Closed On"
    
# Scenario: Filter by Owner
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When column "Owner" is filtered by "priyanka"
    # Then search results are filtered by "Owner"
    
# Scenario: Filter by Case Status
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When column "Case Status" is filtered by "Resolved"
    # Then search results are filtered by "Case Status"