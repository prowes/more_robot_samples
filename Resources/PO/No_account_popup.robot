*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${POPUP_TITLE} =  id=dialog-title
${POPUP_TEXT} =  class=content
${POPUP_CLOSE_BUTTON} =  id=close-modal

${EXPECTED_POPUP_TITLE} =  Don't have an account?


*** Keywords ***
Title is correct
    Wait Until Element Is Visible  ${POPUP_TITLE}
    ${ACTUAL_TEXT} =  Get Text  ${POPUP_TITLE}
    Should Be Equal As Strings  ${ACTUAL_TEXT}  ${EXPECTED_POPUP_TITLE}  ignore_case=true

Text is visible
    Wait Until Element Is Visible  ${POPUP_TEXT}

Click Close and check
    Wait Until Element Is Visible  ${POPUP_CLOSE_BUTTON}
    Click Element  ${POPUP_CLOSE_BUTTON}
    Wait Until Element Is Not Visible  ${POPUP_TITLE}
