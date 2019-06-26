*** Settings ***
Resource    ../../pages/work_area_right/Email.robot
Resource    ../../pages/base/InteractionPortal.robot
Resource    ../../pages/base/Login.robot
Resource    ../../pages/work_area_right/Email.robot
Library    ../../utils/EmailUtil.py
Library    ../../utils/PegaUtil.py    

# Suite Setup    User "JesseCruz" is in CWT Portal
# Suite Teardown    Logout From Pega

*** Test Cases ***
# Scenario: Archive/Discard Message
    # Given Email that "Starts with" "Automatic reply" from "jayson.panganiban@carlsonwagonlit.com" to "pegatest1@contactcwt.com" is received
    # When User selects Workbasket item "Belgium"
    # Then Verify Workbasket contains "Archive/ discard message" cases

# Scenario: Do Not Send Auto Response
    # Given Email that "Contains" "Auto-Reply" from "jayson.panganiban@carlsonwagonlit.com" to "pegatest1@contactcwt.com" is received
    # When User selects Workbasket item "Belgium"
    # Then Verify Workbasket contains "Do Not Send Auto Response" cases
    
# Scenario: Workbasket Routing For EMEA
    # [Setup]    Send Email    jayson.panganiban@carlsonwagonlit.com    Test    pegatest2@contactcwt.com
    # Given CaseId is retrieved from Inbox    pegatest2@contactcwt.com    jayson.panganiban@carlsonwagonlit.com    cwt\\u001jcp    xxxxxx
    # When User selects Workbasket item "BE_BRU_FSA"
    # Then Verify Workbasket contains "BE_BRU_FSA" cases