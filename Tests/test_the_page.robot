*** Settings ***
Resource  ../Resources/PO/Login_section.robot
Resource  ../Resources/PO/Login_problems_popup.robot
Resource  ../Resources/PO/Main_page.robot
Resource  ../Resources/Common.robot
Test Setup  common.Begin Web Test
Test Teardown  common.End Web Test
Documentation  Open the Noona patient login website and check it


*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://demo.patient.noonatest.com/patient/


*** Test Cases ***
The page text elements are shown correctly
    Main_page.English is chosen by default
    Main_page.The title is shown correctly
    Main_page.The description is shown correctly
    Main_page.The bottom text is shown correctly

The login form elements are shown correctly
    Login_section.Email form is shown
    Login_section.Password form is shown
    Login_section.Log in button is shown
    Login_section.Problems logging in link is correct
    Login_section.Account registration link is correct

The "Problems logging in" pop-up is shown correctly
    Login_section.Click Problems logging in
    Login_problems_popup.Title is correct before sending
    Login_problems_popup.Click Close and check
    Login_section.Click Problems logging in
    Login_problems_popup.Enter Email
    Login_problems_popup.Click Send and check the email form
    Login_problems_popup.Title is correct after sending



