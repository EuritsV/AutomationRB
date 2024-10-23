*** Settings ***
Documentation    To validate de Login form
Library        SeleniumLibrary
Library        ../customLibraries/Shop.py
Library        Collections
Test Setup       open the browser with the Mortgage payment url
Suite Setup    Close All Browsers
#Suite Teardown
Resource        ../PO/Generic.robot
Resource        ../PO/landingPage.robot
Resource        ../PO/ShopPage.robot
Resource        ../PO/CheckoutPage.robot
Resource        ../PO/ConfirmationPage.robot
#Test Teardown    Close Browser



*** Variables ***
@{listofProducts}        Blackberry   Nokia Edge
${country_name}          Port

*** Test Cases ***
Validate UnSuccessful Login
    [Tags]    SMOKE    REGRESSION
    landingPage.Fill the login form    ${user_name}    ${invalid_password}
    landingPage.Wait Until Element Is located in the page   
    landingPage.verify the error message is correct

End to end ecommerce Product validation
    [Tags]    REGRESSION
    landingPage.Fill the login form    ${user_name}    ${valid_password}
    ShopPage.Wait Until Element Is located in the page   
    ShopPage.Verify Card titles in the Shop page
    add items to cart and checkout        @{listofProducts}
    #Select the Card    Nokia Edge
    #Confirm checkout items
    CheckoutPage.Verify items in the Checkout Page and proceed
    Enter the Country and select the terms       ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase

Select the Form and navigate to Child window
    landingPage.Fill the Login Detais and Login Form





