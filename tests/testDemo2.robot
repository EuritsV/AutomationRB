*** Settings ***
Documentation    To validate de Login form
Library        SeleniumLibrary
Library        Collections
Test Setup       open the browser with the Mortgage payment url
Resource        ..//PO/Generic.robot
#Test Teardown    Close Browser


*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}         css:.nav-link

*** Test Cases ***
Validate UnSuccessful Login
    [Tags]    SMOKE
    Fill the login form    ${user_name}    ${invalid_password}
    Wait Until Element Is located in the page    ${Error_Message_Login}   
    verify the error message is correct

Validate Cards display in the shopping Page
    Fill the login form    ${user_name}    ${valid_password}
    Wait Until Element Is located in the page    ${Shop_page_load} 
    Verify Card titles in the Shop page 
    Select the Card    Blackberry


Select the Form and navigate to Child window
    Fill the Login Detais and Login Form


*** Keywords ***

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn
Wait Until Element Is located in the page
    [Arguments]    ${element}   
    Wait Until Element Is Visible    ${element}

verify the error message is correct
  #${result}=  Get Text    ${Error_Message_Login}
  #Should Be Equal As Strings    ${result}     Incorrect username/password.
  Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Verify Card titles in the Shop page
    @{expectedList} =    Create List    iphone X        Samsung Note 8      Nokia Edge      Blackberry
    ${elements} =    Get WebElements    css:.card-title
    @{actualList} =    Create List

    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
        
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}
    
Select the Card
    [Arguments]    ${cardName}
    ${elements} =    Get WebElements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If  '${cardName}'== '${element.text}'
        ${index}=  Evaluate  ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[4]/button

#Click radio button
Fill the Login Detais and Login Form
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    learning
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Click Button     id:okayBtn  
    Wait Until Element Is Not Visible    css:.modal-body  
# selecionar um dropdown
    Select From List By Value    css:select.form-control        teach
    Select Checkbox    id:terms
    Checkbox Should Be Selected    id:terms


