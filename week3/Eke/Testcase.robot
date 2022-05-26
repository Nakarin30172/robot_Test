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
    # Log to console      ${current second}
    IF  ${current second} == ${0}
        Log to console      ${current second} = jeckpot
    ELSE IF  ${current second} <= ${30}
        Log to console      ${current second} = Low
    ELSE IF  ${current second} > ${30}
        Log to console      ${current second} = High
    ELSE
        Log to console    ERROR impossible5555
    END
***Test Cases***
1.Test if1 
    [Tags]    if1
    ${current second} =    Get current second
    Log to console      ${current second}
    IF  ${current second} == ${0}
        Log to console    jeckpot
    ELSE IF  ${current second} <= ${30}
        Log to console      Low
    ELSE IF  ${current second} > ${30}
        Log to console    High
    ELSE
        Log to console    ERROR impossible5555
    END

2.Test lOOP
    [Tags]    LOOP
    ${heroes} =    Create list    Batman    Superman    Rockman    Anpanman
    FOR     ${hero}     IN      @{heroes}
        Log to console   ${hero}
    END
3.Test loop2
    [Tags]    LOOP2
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
        WHILE   True 
            ${current1} =    Get current second
            Exit for loop if    '${current second}' != '${current1}'
        END
        Exit for loop if    '${current second}' == '0'
    END



