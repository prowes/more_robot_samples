*** Settings ***
Resource  ../Resources/PO/Login_section.robot
Resource  ../Resources/Common.robot
Test Setup  common.Begin Web Test
Test Teardown  common.End Web Test
Documentation  Open the Noona patient login website and check it


*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://demo.patient.noonatest.com/patient/


*** Test Cases ***
The notification is shown when Login data is wrong
    log  Accessing to ${START_URL}
    Go To  ${START_URL}
    Login_section.Email form is shown
    Login_section.Enter email
    Login_section.Password form is shown
    Login_section.Enter password
    Login_section.Click Log in
    Login_section.Check notification
