*** Settings ***
Library     WhiteLibrary
#Test Teardown       Close Window

*** Keywords ***
Click save button
    log to console      test

*** Test Cases ***
POS
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

   ${text_to_verify}=       WhiteLibrary.Get Text From Label         id:invalidUserPass
   Should be equal      ${text_to_verify}       เย้ เครื่องพร้อมแล้วค่า       

Tc02
    [Tags]    Case2

        @{windows}    WhiteLibrary.Get Desktop Windows
            FOR     ${item}     IN  @{windows}
                log     ${item}
                ${status}=          Run keyword and return status           Should Contain      ${item.Title}     POS Training
                ${pos_window}=      Run keyword if  ${status}       Set variable    ${item}
                Exit for loop if    ${status}
            END
            WhiteLibrary.Attach Window          ${pos_window}

            WhiteLibrary.Click item                 id:textUserName     

            ${id}=   Create list      0   1  2  3  4  5  6
            FOR    ${item}     IN    @{id}
                    WhiteLibrary.Press Keys     ${item}
            END

            WhiteLibrary.Click item                id:textBox2     

            ${id}=   Create list      1  2  3  4  5  6  0
            FOR    ${item}     IN    @{id}
                    WhiteLibrary.Press Keys     ${item}
            END

            WhiteLibrary.Click button               id:buttonEnter


    WhiteLibrary.Button Text Should Be        id:btnClearAll       ยกเลิกการขาย

    WhiteLibrary.Button Text Should Be        id:readyBtn          เรียกบิล
 #username: 0123456
 #password: 1234560

 Tc03
        [Tags]    Case3

            @{windows}    WhiteLibrary.Get Desktop Windows
                FOR     ${item}     IN  @{windows}
                    log     ${item}
                    ${status}=          Run keyword and return status           Should Contain      ${item.Title}     POS Training
                    ${pos_window}=      Run keyword if  ${status}       Set variable    ${item}
                    Exit for loop if    ${status}
                END
                WhiteLibrary.Attach Window          ${pos_window}

                WhiteLibrary.Click item                 id:textUserName     

                ${id}=   Create list      0   1  2  3  4  5  6
                FOR    ${item}     IN    @{id}
                        WhiteLibrary.Press Keys     ${item}
                END

                WhiteLibrary.Click item                id:textBox2     

                ${id}=   Create list      1  2  3  4  5  6  0
                FOR    ${item}     IN    @{id}
                        WhiteLibrary.Press Keys     ${item}
                END

                WhiteLibrary.Click button               id:buttonEnter


                WhiteLibrary.Input text to textbox      id:tbBarcode        EGG
                WhiteLibrary.Click button               id:btnAdd

                WhiteLibrary.Input text to textbox      id:tbBarcode     Chicken
                WhiteLibrary.Click button               id:btnAdd

                WhiteLibrary.Input text to textbox      id:tbBarcode     Fish
                WhiteLibrary.Click button               id:btnAdd

    ${text_to_total}=       WhiteLibrary.Get Text From Label         id:total
    Should be equal      ${text_to_total}       3

    ${text_to_totalItem}=       WhiteLibrary.Get Text From Label         id:totalItems
    Should be equal      ${text_to_totalItem}       6

    ${text_to_totalprice}=       WhiteLibrary.Get Text From Label         id:lblTotalPrice
    Should be equal      ${text_to_totalprice}       60.00
           
Tc04
        [Tags]    Case4

            @{windows}    WhiteLibrary.Get Desktop Windows
                FOR     ${item}     IN  @{windows}
                    log     ${item}
                    ${status}=          Run keyword and return status           Should Contain      ${item.Title}     POS Training
                    ${pos_window}=      Run keyword if  ${status}       Set variable    ${item}
                    Exit for loop if    ${status}
                END
                WhiteLibrary.Attach Window          ${pos_window}

                WhiteLibrary.Click item                 id:textUserName     

                ${id}=   Create list      0   1  2  3  4  5  6
                FOR    ${item}     IN    @{id}
                        WhiteLibrary.Press Keys     ${item}
                END

                WhiteLibrary.Click item                id:textBox2     

                ${id}=   Create list      1  2  3  4  5  6  0
                FOR    ${item}     IN    @{id}
                        WhiteLibrary.Press Keys     ${item}
                END

                WhiteLibrary.Click button               id:buttonEnter


                WhiteLibrary.Input text to textbox      id:tbBarcode        EGG
                WhiteLibrary.Click button               id:btnAdd

                WhiteLibrary.Input text to textbox      id:tbBarcode     Chicken
                WhiteLibrary.Click button               id:btnAdd

                WhiteLibrary.Input text to textbox      id:tbBarcode     Fish
                WhiteLibrary.Click button               id:btnAdd

    ${text_to_total}=       WhiteLibrary.Get Text From Label         id:total
    Should be equal      ${text_to_total}       3

    ${text_to_totalItem}=       WhiteLibrary.Get Text From Label         id:totalItems
    Should be equal      ${text_to_totalItem}       6

    ${text_to_totalprice}=       WhiteLibrary.Get Text From Label         id:lblTotalPrice
    Should be equal      ${text_to_totalprice}       60.00
           
    #Case4
    #เลือกส่าขา
    WhiteLibrary.Select Combobox index      id:comboBox1        1

    #เลือกสะสม All Member
    WhiteLibrary.Click button               id:btnAllmember
    WhiteLibrary.Select Radio Button        id:radioButton1Yes
    WhiteLibrary.Click button               id:closeBtn
    
    WhiteLibrary.Click button               id:readyBtn


    ${Name_store}=       WhiteLibrary.Get Text From Label         id:lblStore2
    Should be equal      ${Name_store}       Store 2 : สาขา ปทุมวัน

    ${Sum_list}=       WhiteLibrary.Get Text From Label         id:lblItem2
    Should be equal      ${Sum_list}       3

    ${Number_of_pieces}=       WhiteLibrary.Get Text From Label         id:lblPrice2
    Should be equal      ${Number_of_pieces}       6

    ${Total_price}=       WhiteLibrary.Get Text From Label         id:lblTotal2
    Should be equal      ${Total_price}       60.00

    ${Allmember}=       WhiteLibrary.Get Text From Label         id:lblAllmem2
    Should be equal      ${Allmember}       Yes

    WhiteLibrary.Click button               id:btnOk

