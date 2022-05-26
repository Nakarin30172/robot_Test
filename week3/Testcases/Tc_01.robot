*** Settings ***
Resource    ${CURDIR}/../keywords/imports.robot
*** Test Cases ***
TC_01
    [Tags]  no_structures
    # Open browser    https://ebay.com    chrome
    # Wait until element is visible    id=mainContent    30s
    # Input text    id=gh-ac    speaker
    # Click element   id=gh-btn
    common.Open ebay website
    home_page.Search product by Keyword  ${tc_01['search_keyword']}


    Wait until element is visible    xpath=//div[@id='mainContent']//li[contains(@class,'s-item')]
    ${result}=    Get text    //h1[@class='srp-controls__count-heading']//span[2]
    Should be equal    speaker    ${result}
    ${all_products}    Get Webelements    //div[@id='srp-river-results']//h3[@class='s-item__title']
    FOR    ${product}    IN    @{all_products}
        ${each_product}    Get text    ${product}
        Log to console    ${each_product}
    END
    Close browser