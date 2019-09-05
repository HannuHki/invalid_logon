*** Settings ***
Library    SeleniumLibrary
Test Teardown   Close Browser
Test Setup      Open browser to login page

*** Variables ***
${SERVER}    localhost:7272
${SERVER2}    facebook.com
${SERVER3}    10.51.130.52
${HOST}    http://${SERVER2}
${VALID_USERNAME}    demo
${VALID_PASSWORD}    mode
${WELCOME_TITLE}     Welcome Page
${BROWSER}           chrome

*** Test Cases ***
Invalid login
    Enter username    jaska
    Enter password    jokunen
    Log in
    Error page should be open

*** Keywords ***

Open browser to login page
    Open browser    ${HOST}

Enter username
    [Arguments]    ${username}
#    Input text      username_field    ${username}   
    Input text    //input[@class='inputtext login_form_input_box']    ${username}
    

Enter password
    [Arguments]    ${password}
#    Input password      password_field    ${password}
    Input password      //input[@class='inputtext login_form_input_box']    ${password}

    
Log In
#    Click button    LOGIN
    Click button    //input[@value='Log In']
    @{Window_List}    Get Window Titles
    log to console    -----0: ${Window_List}[0]
    ${Invalid_title}=    Set Variable    ${Window_List}[0]
    log to console    -----invalid: ${Invalid_title}


Error page should be open
    #Title should be    Error Page
    Title should be    Log into Facebook | Facebook    
