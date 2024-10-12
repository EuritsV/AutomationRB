*** Settings ***
Documentation    To validate de Login form
Library        SeleniumLibrary
Test Setup       open the browser with the Mortgage payment url
Resource        resource.robot
Test Teardown    Close Browser


*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}         css:.nav-link

*** Test Cases ***
Validate UnSuccessful Login
    Fill the login form    ${user_name}    ${invalid_password}
    Wait Until Element Is located in the page    ${Error_Message_Login}   
    verify the error message is correct

Validate Cards display in the shopping Page
    Fill the login form    ${user_name}    ${valid_password}
    Wait Until Element Is located in the page    ${Shop_page_load}  

*** Keywords ***

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn
Wait Until Element Is located in the page
    [Arguments]    ${element}   
    Wait Until Element Is Visible        ${element}

verify the error message is correct
  #${result}=  Get Text    ${Error_Message_Login}
  #Should Be Equal As Strings    ${result}     Incorrect username/password.
  Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.