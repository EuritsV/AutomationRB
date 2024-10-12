*** Settings ***
Documentation    A resource file with reusable keywords and variables
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