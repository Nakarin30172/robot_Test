*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${main_content}=    id=mainContent
*** Keywords ***
Open ebay website
    SeleniumLibrary.Open browser    ${browser['url']}    ${browser['type']}  
    SeleniumLibrary.Wait until element is visible   ${main_content}   30s
Wait until element is visible by locator
    [Arguments]    ${locator}    ${timeout}=10s
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
Input text by locator
    [Arguments]    ${locator}    ${keyword}
    SeleniumLibrary.Input text    ${locator}    ${keyword}
Click element by locator
    [Arguments]    ${locator}
    SeleniumLibrary.Click element    ${locator}
Get text by locator
    [Arguments]    ${locator}
    [Return]    SeleniumLibrary.Get text    ${locator}
Close browser
    SeleniumLibrary.Close browser