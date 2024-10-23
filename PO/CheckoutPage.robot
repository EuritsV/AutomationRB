*** Settings ***
Documentation    All the page object and keywords of Shop page
Library    SeleniumLibrary
Library    Collections


*** Variables ***
${Shop_page_load}         css:.nav-link

*** Keywords ***
Verify items in the Checkout Page and proceed
    #Scroll Element Into View    css:.active 
   # Click Link    css:.active
    Click Element    css:.btn-success