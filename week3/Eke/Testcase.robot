***Settings***
Library     SeleniumLibrary
Library     Collections
Library     DateTime

Test Setup      Log to console     ${EMPTY}

*** Keywords ***
Get current second
    ${current}    Get Current Date    result_format=datetime
    [Return]    ${current.second}

Get Checkdata
    [Arguments]    ${current second}    
    #[Arguments] เป็นการประกาศตัวเเปรรับ เขามาใน Def 
    # การใช้งาน if elseif else and or
    IF  ${current second} > ${0} and ${current second} <= ${30}
        Log to console      ${current second} = Low
    ELSE IF  ${current second} > ${30} and ${current second} != ${0}
        Log to console      ${current second} = High
    ELSE
        Log to console     ${current second} = jeckpot
    END

***Test Cases***
1.Test if1 
    [Tags]    Inline
    # การเขียนในรูปเเบบ inline if เงื่อนไข1 ผลลัพธ์1 if เงื่อนไข2 ผลลัพธ์2 .... else 
    ${current second} =    Get current second
    Log to console      ${current second}
    IF  ${current second} <= ${30}   Log to console      Low    IF  ${current second} > ${30}   Log to console    High     ELSE    Log to console    jeckpot

2.Test lOOP
    [Tags]    LOOP
    # การFor การวนลูป ข้อมูลตามที่ Set 
    ${heroes} =    Create list    Batman    Superman    Rockman    Anpanman
    FOR     ${hero}     IN      @{heroes}
        Log to console   ${hero}
    END
3.Test loop2
    [Tags]    LOOP2
    # การFor การวนลูป ข้อมูลตามที่ Set  โดยใช้ Range โดยมี Format start stop   STEP
    ${heroes} =    Create list    Batman    Superman    Rockman    Anpanman
    FOR     ${index}    IN RANGE    0   10  2
        Log to console  ${index}
        Continue 
    END
4.Test loop Quiz
    [Tags]    Quiz
    WHILE   True 
        ${current second} =    Get current second
        Get Checkdata   ${current second} 
        Exit for loop if    '${current second}' == '0'
        Sleep    1s
    END
5.Test loop Quiz
    [Tags]    Quiz1
    FOR    ${i}    IN RANGE    60  
        ${current second} =    Get current second
        IF  ${current second} == ${0}
            Log to console      ${current second} = jeckpot
        ELSE IF  ${current second} <= ${30}
            Log to console      ${current second} = Low
        ELSE IF  ${current second} > ${30}
            Log to console      ${current second} = High
        ELSE
            Log to console    .......
        END
        Exit for loop if    '${current second}' == '0'
        Sleep    1s
    END



