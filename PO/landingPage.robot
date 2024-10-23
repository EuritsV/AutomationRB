*** Settings ***
Documentation    All the page object and keywords of landing page 
Library    SeleniumLibrary
Resource    Generic.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

Wait Until Element Is located in the page
    wait until element passed is located on Page      ${Error_Message_Login}    

    #Wait Until Element Is Visible   ${Error_Message_Login}
           
verify the error message is correct
  #${result}=  Get Text    ${Error_Message_Login}
  #Should Be Equal As Strings    ${result}     Incorrect username/password.
  Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Fill the Login Detais and Login Form
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    learning
#Click radio button
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Click Button     id:okayBtn  
    Wait Until Element Is Not Visible    css:.modal-body  
# selecionar um dropdown
    Select From List By Value    css:select.form-control        teach
    Select Checkbox    id:terms
    Checkbox Should Be Selected    id:terms

