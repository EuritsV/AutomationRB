*** Settings ***
Documentation    A resource file with reusable keywords and variables
...               The system specific keywords created here form our own 
...                domain specific language. They utilize keywords provided
...                by the imported SeleniumLibrary 
Library    SeleniumLibrary
*** Variables ***
${url}         https://rahulshettyacademy.com/loginpagePractise/
${browser}    Chrome
${user_name}    rahulshettyacademy
${invalid_password}    12345
${valid_password}    learning

*** Keywords ***
open the browser with the Mortgage payment url
        Open Browser    ${url}      ${browser}

wait until element passed is located on Page
    [Arguments]    ${page_locater}
    Wait Until Element Is Visible   ${page_locater}