*** Settings ***
Documentation    To validate de Login form
Library        SeleniumLibrary
Test Teardown    Close Browser


*** Variables ***
${url}         https://rahulshettyacademy.com/loginpagePractise/
${browser}    Chrome
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***
validate UnSuccessful Login
    open the browser with the Mortgage payment url
    Fill the login form
    wait until it checks and display the error message
    verify the error message is correct



*** Keywords ***
open the browser with the Mortgage payment url
    Open Browser    ${url}      ${browser}
Fill the login form
    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    12345
    Click Button    id:signInBtn
wait until it checks and display the error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify the error message is correct
  #${result}=  Get Text    ${Error_Message_Login}
  #Should Be Equal As Strings    ${result}     Incorrect username/password.
  Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

    

