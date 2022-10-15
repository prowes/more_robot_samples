*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${POPUP_TITLE} =  id=dialog-title
${EMAIL_FORM_RESET} =  id=password-reset-email
${CLOSE_BUTTON} =  id=password-reset-cancel
${SEND_BUTTON} =  id=password-reset-submit

${EXPECTED_POPUP_TITLE_BEFORE} =  Problems logging in?
${EXPECTED_POPUP_TITLE_AFTER} =   Instructions to login sent to your email
${EMAIL_VALUE} =  fake@varian.com


*** Keywords ***
Title is correct before sending
    Wait Until Element Is Visible  ${POPUP_TITLE}
    ${ACTUAL_TEXT} =  Get Text  ${POPUP_TITLE}
    Should Be Equal As Strings  ${ACTUAL_TEXT}  ${EXPECTED_POPUP_TITLE_BEFORE}  ignore_case=true

Click Close and check
    Wait Until Element Is Visible  ${CLOSE_BUTTON}
    Click Element  ${CLOSE_BUTTON}
    Wait Until Element Is Not Visible  ${POPUP_TITLE}

Enter Email
    Wait Until Element Is Visible  ${EMAIL_FORM_RESET}
    Input Text  ${EMAIL_FORM_RESET}  ${EMAIL_VALUE}

Click Send and check the email form
    Wait Until Element Is Enabled  ${SEND_BUTTON}
    Click Element  ${SEND_BUTTON}
    Wait Until Element Is Not Visible  ${EMAIL_FORM_RESET}

Title is correct after sending
    ${ACTUAL_TEXT} =  Get Text  ${POPUP_TITLE}
    Should Be Equal As Strings  ${ACTUAL_TEXT}  ${EXPECTED_POPUP_TITLE_AFTER}  ignore_case=true
