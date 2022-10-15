*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LANGUAGE_PICKER} =  class=ng-value-container
${CHOSEN_LANGUAGE} =  class=ng-option-selected
${TITLE} =  class=login-header
${DESCRIPTION} =  class=login-description

${PRIVACY_STATEMENT} =  class=privacy-policy
${ABOUT} =  class=about
${MARKING_DESCRIPTION} =  class=ce-marking-description
${DISCLAIMER} =  class=ce-marking-warning
${COPYRIGHT} =  class=copymark

${EXPECTED_LANGUAGE} =  English
${EXPECTED_TITLE} =  Welcome to Noona
${EXPECTED_DESCRIPTION} =  Please enter your email address and password.
${EXPECTED_PRIVACY_STATEMENT_TEXT} =  Privacy statement
${EXPECTED_ABOUT_TEXT} =  About


*** Keywords ***
English is chosen by default
    Wait Until Element Is Visible  ${LANGUAGE_PICKER}
    Click Element  ${LANGUAGE_PICKER}
    Wait Until Element Is Visible  ${CHOSEN_LANGUAGE}
    ${ACTUAL_TEXT} =  Get Text  ${CHOSEN_LANGUAGE}
    Should Be Equal As Strings  ${ACTUAL_TEXT}  ${EXPECTED_LANGUAGE}

The title is shown correctly
    Wait Until Element Is Visible  ${TITLE}
    ${ACTUAL_TEXT} =  Get Text  ${TITLE}
    Should Be Equal As Strings  ${ACTUAL_TEXT}  ${EXPECTED_TITLE}

The description is shown correctly
    Wait Until Element Is Visible  ${DESCRIPTION}
    ${ACTUAL_TEXT} =  Get Text  ${DESCRIPTION}
    Should Be Equal As Strings  ${ACTUAL_TEXT}  ${EXPECTED_DESCRIPTION}

The Privacy statement link is shown correctly
    Wait Until Element Is Visible  ${PRIVACY_STATEMENT}
    ${ACTUAL_TEXT} =  Get Text  ${DESCRIPTION}
    Should Be Equal As Strings  ${ACTUAL_TEXT}  ${PRIVACY_STATEMENT}

Click the Privacy statement link
    Wait Until Element Is Visible  ${PRIVACY_STATEMENT}
    Click Element  ${PRIVACY_STATEMENT}

Click the About link
    Wait Until Element Is Visible  ${ABOUT}
    Click Element  ${ABOUT}

The About link is shown correctly
    Wait Until Element Is Visible  ${PRIVACY_STATEMENT}
    ${ACTUAL_TEXT} =  Get Text  ${DESCRIPTION}
    Should Be Equal As Strings  ${ACTUAL_TEXT}  ${EXPECTED_ABOUT_TEXT}

The bottom text is shown correctly
    Wait Until Element Is Visible  ${MARKING_DESCRIPTION}
    Wait Until Element Is Visible  ${DISCLAIMER}
    Wait Until Element Is Visible  ${COPYRIGHT}
