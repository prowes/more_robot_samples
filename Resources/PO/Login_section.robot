*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${EMAIL_FORM} =  id=email
${PASSWORD_FORM} =  id=pwd
${LOGIN_BUTTON} =  id=email-and-password-next-button
${ERROR_NOTIFICATION} =  id=login-form-error
${PROBLEMS_LINK} =  id=email-and-password-password-reset-link
${NO_ACCOUNT_LINK} =  id=open-information-overlay

${EMAIL_VALUE} =  fake@varian.com
${PASSWORD_VALUE} =  qwerty
${EXPECTED_ERROR} =  Incorrect username or password. If you have forgotten your password, please click Problems logging in -link.
${EXPECTED_PROBLEMS_LINK_TEXT} =  Problems logging in?
${EXPECTED_NO_ACCOUNT_LINK_TEXT} =  Don't have an account?


*** Keywords ***
Email form is shown
    Wait Until Element Is Visible  ${EMAIL_FORM}

Enter email
    Input Text  ${EMAIL_FORM}  ${EMAIL_VALUE}

Password form is shown
    Wait Until Element Is Visible  ${PASSWORD_FORM}

Enter password
    Input Text  ${PASSWORD_FORM}  ${PASSWORD_VALUE}

Log in button is shown
    Wait Until Element Is Visible  ${LOGIN_BUTTON}

Log in button is disabled
    Element Should Be Disabled  ${LOGIN_BUTTON}

Click Log in
    Wait Until Element Is Enabled  ${LOGIN_BUTTON}
    Click Element  ${LOGIN_BUTTON}

Check notification
    Wait Until Element Is Visible  ${ERROR_NOTIFICATION}
    ${ACTUAL_TEXT} =  Get Text  ${ERROR_NOTIFICATION}
    Should Be Equal As Strings  ${ACTUAL_TEXT}  ${EXPECTED_ERROR}

Problems logging in link is correct
    Wait Until Element Is Visible  ${PROBLEMS_LINK}
    ${ACTUAL_TEXT} =  Get Text  ${PROBLEMS_LINK}
    Should Be Equal As Strings  ${ACTUAL_TEXT}  ${EXPECTED_PROBLEMS_LINK_TEXT}  ignore_case=true

Click Problems logging in
    Wait Until Element Is Visible  ${PROBLEMS_LINK}
    Click Element  ${PROBLEMS_LINK}

Account registration link is correct
    Wait Until Element Is Visible  ${NO_ACCOUNT_LINK}
    ${ACTUAL_TEXT} =  Get Text  ${NO_ACCOUNT_LINK}
    Should Be Equal As Strings  ${ACTUAL_TEXT}  ${EXPECTED_NO_ACCOUNT_LINK_TEXT}  ignore_case=true

