*** Settings ***
Documentation    To validate de Login form
Library        SeleniumLibrary
Test Teardown    Close Browser
Test Template    Validate UnSuccessful Login


*** Variables ***
${url}         https://rahulshettyacademy.com/loginpagePractise/
${browser}    Chrome
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***        username            password
Invalid username        dportugal             learning
Invalid password        rahulshettyacademy    loading
Special characters        @#$                  learning

*** Keywords ***
validate UnSuccessful Login
    [Arguments]        ${username}        ${password}
    open the browser with the Mortgage payment url
    Fill the login form    ${username}        ${password} 
    wait until it checks and display the error message
    verify the error message is correct

open the browser with the Mortgage payment url
    Open Browser    ${url}      ${browser}
Fill the login form
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn
wait until it checks and display the error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify the error message is correct
  #${result}=  Get Text    ${Error_Message_Login}
  #Should Be Equal As Strings    ${result}     Incorrect username/password.
  Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.
