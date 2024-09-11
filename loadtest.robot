*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${chrome_DRIVER_PATH}     chromedriver.exe
${BROWSER}    chrome
${BASE_URL}        https://demo.nopcommerce.com 
${NUM_USERS}       5                           
${DURATION}       30s 

*** Test Cases ***
Sign Up Test
    [Documentation]    
    Open Browser    https://demo.nopcommerce.com/register    ${BROWSER}    executable_path=${chrome_DRIVER_PATH}
    [Timeout]    10 minutes
    Input Text    id=FirstName    ali1122344455
    Input Text    id=LastName    Rajpoot
    Input Text    id=Email    ali1122344455@gmail.com
    Input Password    id=Password    ali1122344455
    Input Password    id=ConfirmPassword    ali1122344455
    Press Enter Key    id=ConfirmPassword
    ${register_button_exists}=    Run Keyword And Return Status    Element Should Be Visible    id=register-button    timeout=10s
    Run Keyword If    ${register_button_exists}    Press Keys    id=register-button    \\13
    ...    ELSE    Log    Register button not found
    Wait Until Page Contains    Your registration completed    timeout=30s
    Capture Page Screenshot
    [Teardown]    Close Browser

Login Test
    [Documentation]    
    Open Browser    https://demo.nopcommerce.com/login    ${BROWSER}    executable_path=${chrome_DRIVER_PATH}
    [Timeout]    10 minutes
    Input Text    id=Email    ali1122344455@gmail.com
    Input Password    id=Password    ali1122344455
    Press Enter Key    id=Password
    Wait Until Page Contains Element    xpath=//a[@class='ico-logout']    timeout=20s
    Capture Page Screenshot
    [Teardown]    Close Browser

Simulate Load Test
    [Documentation] 
     FOR  ${i}  IN RANGE  ${NUM_USERS}
        
        Open Browser    ${BASE_URL}    Chrome
        # Simulate user actions (replace with desired actions on your chosen website)
        Wait Until Element Is Visible    id=small-searchterms    timeout=10s
        Input Text     id=small-searchterms   your_search_term
        Click Element   class=button-1
        Sleep          2s                          # Introduce a delay to simulate user behavior (adjust as needed)
        Close Browser
     END


*** Keywords ***
Input Password
    [Arguments]    ${locator}    ${password}
    Input Text    ${locator}    ${password}

Press Enter Key
    [Arguments]    ${locator}
    Press Key    ${locator}    \\13