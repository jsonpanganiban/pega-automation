*** Settings ***
Resource    ../../pages/base/InteractionPortal.robot
Resource    ../../pages/base/Login.robot
Resource    ../../pages/work_area_center/BulkActions.robot

Suite Setup    User "TrafficManager1" is in CWT Portal
Suite Teardown    Logout From Pega

*** Test Cases ***
Scenario: Increase Priority
    Given User navigates to Bulk Action
    When Update Urgency Is Selected
    Then Bulk Urgency Update Error Message is prompt
   [Teardown]    User closes the bulk actions tab 

Scenario: Increase Priority Bulk Update
    Given User navigates to Bulk Action
    When User selects Workbasket item "BE_Onsite ECR" in Bulk Actions tab
    And User updates multiple cases to "10" and reason to "Ticketing Deadline"
    Then Verify urgency of updated cases are "10"
    [Teardown]    Run Keywords    User updates multiple cases to "80" and reason to "Issue Ticket"
    ...    AND    User closes the bulk actions tab
    ...            
Scenario: Increase Priority Single Case
    Given User navigates to Bulk Action
    When User selects Workbasket item "BE_Onsite ECR" in Bulk Actions tab
    And User updates case id "I-2556" urgency to "10" and reason to "Day of travel"
    Then Verify case id "I-2556" urgency is "10"
    [Teardown]    Run Keywords    User updates case id "I-2556" urgency to "80" and reason to "Issue Ticket"
    ...    AND    User closes the bulk actions tab