
*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/../common.robot
Variables   ${CURDIR}/../resources/testdata/testdata.yaml
*** Variables ***
${main_content}=    id=mainContent
${search_text}=    id=gh-ac
${search_button}=    id=gh-btn

*** Keywords ***
# Open ebay website
    # SeleniumLibrary.Open browser    ${browser['url']}   ${browser['type']}
    # SeleniumLibrary.Wait until element is visible   ${main_content}   30s
    common.Open ebay website
Search product by Keyword
    [Arguments]    ${keyword}
    # SeleniumLibrary.Input text    ${search_text}    ${keyword}
    # SeleniumLibrary.Click element   ${search_button}
    common.Input text by locator  ${search_text}    ${keyword}
    common.Click element by locator  ${search_button}