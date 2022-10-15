*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${ABOUT_TITLE} =  class=about-heading
${ABOUT_VERSION} =  id=version-info
${COPYRIGHT_INFO} =  id=copyright-info
${MADE_INFO} =  id=manufactured-info
${MAKER_INFO} =  id=manufacturer-info
${EU_REP} =  id=eu-representative
${ICONS} =  id=about-icons
${QR_CODE} =  class=about__barcode

${ABOUT_CLOSE} =  id=close-modal


*** Keywords ***
Elements are shown
    Wait Until Element Is Visible  ${ABOUT_TITLE}
    Wait Until Element Is Visible  ${ABOUT_VERSION}
    Wait Until Element Is Visible  ${COPYRIGHT_INFO}
    Wait Until Element Is Visible  ${MADE_INFO}
    Wait Until Element Is Visible  ${MAKER_INFO}
    Wait Until Element Is Visible  ${EU_REP}
    Wait Until Element Is Visible  ${ICONS}
    Wait Until Element Is Visible  ${QR_CODE}

Click Close and check
    Wait Until Element Is Visible  ${ABOUT_CLOSE}
    Click Element  ${ABOUT_CLOSE}
    Wait Until Element Is Not Visible  ${ABOUT_TITLE}
