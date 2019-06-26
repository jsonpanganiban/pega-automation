*** Settings ***
Resource   ../../pages/base/Login.robot
Resource   ../../pages/work_area_center/AdvancedCaseSearch.robot

Suite Setup    User "JesseCruz" is in CWT Portal
Suite Teardown    Logout From Pega    

*** Test Cases ***    
Scenario: Default sort is by Case ID Descending
    Given User is in Advanced Case Search Landing Page
    When the Search button is clicked
    Then search results are sorted by "Case ID" in "Descending" order
    
Scenario: Sort by Case ID Ascending
    Given column "Case ID" is sorted by default
    When column "Case ID" is sorted
    Then search results are sorted by "Case ID" in "Ascending" order
    
# Scenario: Sort by To Email Address Descending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "To Email Address" column is selected
    # Then search results are sorted by "To Email Address" in "Descending" order
    
# Scenario: Sort by To Email Address Ascending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "To Email Address" column is selected
    # Then search results are sorted by "To Email Address" in "Ascending" order
      
# Scenario: Sort by From Email Address Descending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "From Email Address" column is selected
    # Then search results are sorted by "From Email Address" in "Descending" order
    
# Scenario: Sort by From Email Address Ascending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "From Email Address" column is selected
    # Then search results are sorted by "From Email Address" in "Ascending" order
    
# Scenario: Sort by Subject of Email Descending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "Subject of Email" column is selected
    # Then search results are sorted by "Subject of Email" in "Descending" order
    
# Scenario: Sort by Subject of Email Ascending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "Subject of Email" column is selected
    # Then search results are sorted by "Subject of Email" in "Ascending" order
    
# Scenario: Sort by Created On Descending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "Created On" column is selected
    # Then search results are sorted by "Created On" in "Descending" order
    
# Scenario: Sort by Created On Ascending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "Created On" column is selected
    # Then search results are sorted by "Created On" in "Ascending" order
    
# Scenario: Sort by Updated On Descending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "Updated On" column is selected
    # Then search results are sorted by "Updated On" in "Descending" order
    
# Scenario: Sort by Updated On Ascending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "Updated On" column is selected
    # Then search results are sorted by "Updated On" in "Ascending" order
    
# Scenario: Sort by Closed On Descending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "Closed On" column is selected
    # Then search results are sorted by "Closed On" in "Descending" order
    
# Scenario: Sort by Closed On Ascending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "Closed On" column is selected
    # Then search results are sorted by "Closed On" in "Ascending" order
    
# Scenario: Sort by Owner Descending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "Owner" column is selected
    # Then search results are sorted by "Owner" in "Descending" order
    
# Scenario: Sort by Owner Ascending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "Owner" column is selected
    # Then search results are sorted by "Owner" in "Ascending" order
    
# Scenario: Sort by Case Status Descending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "Case Status" column is selected
    # Then search results are sorted by "Case Status" in "Descending" order
    
# Scenario: Sort by Case Status Ascending
    # Given User is in Advanced Case Search Landing Page
    # And all cases are displayed
    # When the "Case Status" column is selected
    # Then search results are sorted by "Case Status" in "Ascending" order