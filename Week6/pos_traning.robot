*** Settings ***
Library     WhiteLibrary
#Test Teardown       Close Window
*** Variables ***
    ${pos_traning.additem}             id:tbBarcode
*** Keywords ***
Click save button
    log to console      test
Input data to
    [Arguments]    ${keyword}   ${User} 
    WhiteLibrary.Click item      ${keyword}   
    FOR    ${item}      IN      @{User}
        WhiteLibrary.Press Keys     ${item} 
    END
InputbtnApp data to
    [Arguments]    ${keyword}   ${item}
    WhiteLibrary.Input text to textbox      ${keyword}        ${item}
    WhiteLibrary.Click button               id:btnAdd
Check Get Text From Label
    [Arguments]    ${keyword}   ${item}
    ${text_to_total}=       WhiteLibrary.Get Text From Label         ${keyword}
    Should be equal      ${text_to_total}       ${item}

Fo Attach Window 
    @{windows}    WhiteLibrary.Get Desktop Windows
        FOR     ${item}     IN  @{windows}
            log     ${item}
            ${status}=          Run keyword and return status           Should Contain      ${item.Title}     POS Training
            ${pos_window}=      Run keyword if  ${status}       Set variable    ${item}
            Exit for loop if    ${status}
        END
        WhiteLibrary.Attach Window          ${pos_window}

*** Test Cases ***
POSTest1
    [tags]     Test1
    @{windows}    WhiteLibrary.Get Desktop Windows
    FOR     ${item}     IN  @{windows}
        log     ${item}
        ${status}=          Run keyword and return status           Should Contain      ${item.Title}     POS Training
        ${pos_window}=      Run keyword if  ${status}       Set variable    ${item}
        Exit for loop if    ${status}
    END
    WhiteLibrary.Attach Window          ${pos_window}
    WhiteLibrary.Input text to textbox      id:textUserName     711
    WhiteLibrary.Input text to textbox      id:textBox2         123
    WhiteLibrary.Click button               id:buttonEnter
    ${button}=    WhiteLibrary.Get text from label        id:invalidUserPass
    Should be equal     ${button}       เย้ เครื่องพร้อมแล้วค่า



POSTest2
    [Tags]  TC2

    Fo Attach Window 

    ${User} =   Create List      0   1   2   3   4   5   6
    ${pass} =   Create List      1   2   3   4   5   6    0

    WhiteLibrary.Click button               id:buttonEnter
    WhiteLibrary.Button Text Should Be    id:btnClearAll     ยกเลิกการขาย
    WhiteLibrary.Button Text Should Be    id:readyBtn       เรียกบิล




Tc03
    [Tags]    Tc3

    Fo Attach Window 

    ${User} =   Create List      0   1   2   3   4   5   6
    ${pass} =   Create List      1   2   3   4   5   6    0

    Input data to  id:textUserName  ${User}
    Input data to  id:textBox2  ${pass}
    WhiteLibrary.Click button               id:buttonEnter

    InputbtnApp data to  id:tbBarcode  robot
    InputbtnApp data to  id:tbBarcode  framework
    InputbtnApp data to  id:tbBarcode  debuglibrary

    Check Get Text From Label  id:total  3
    Check Get Text From Label  id:totalItems  6
    Check Get Text From Label  id:lblTotalPrice  60.00


Tc04
    [Tags]    Tc4

    Fo Attach Window 

    ${User} =   Create List      0   1   2   3   4   5   6
    ${pass} =   Create List      1   2   3   4   5   6    0

    Input data to  id:textUserName  ${User}
    Input data to  id:textBox2  ${pass}
    WhiteLibrary.Click button               id:buttonEnter
    InputbtnApp data to  id:tbBarcode  robot
    InputbtnApp data to  id:tbBarcode  framework
    InputbtnApp data to  id:tbBarcode  ride error

    Check Get Text From Label  id:total  3
    Check Get Text From Label  id:totalItems  6
    Check Get Text From Label  id:lblTotalPrice  60.00



    WhiteLibrary.Select Combobox index      id:comboBox1        1

    WhiteLibrary.Click button               id:btnAllmember
    WhiteLibrary.Select Radio Button        id:radioButton1Yes
    WhiteLibrary.Click button               id:closeBtn
    
    WhiteLibrary.Click button               id:readyBtn

    Check Get Text From Label  id:lblItem2  3
    Check Get Text From Label  id:lblPrice2  6
    Check Get Text From Label  id:lblTotal2  60.00
    Check Get Text From Label  id:lblAllmem2  Yes

    WhiteLibrary.Click button               id:btnOk