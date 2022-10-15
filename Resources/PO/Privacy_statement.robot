*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${PRIVACY_POLICY_TEXT} =  id=showdown
${PRIVACY_POLICY_CLOSE} =  class=privacy-policy-modal-buttons


*** Keywords ***
Text is shown
    Wait Until Element Is Visible  ${PRIVACY_POLICY_TEXT}

Click Close and check
    Wait Until Element Is Visible  ${PRIVACY_POLICY_CLOSE}
    Click Element  ${PRIVACY_POLICY_CLOSE}
    Wait Until Element Is Not Visible  ${PRIVACY_POLICY_TEXT}
