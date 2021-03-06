***Settings***
Library     SeleniumLibrary
Library     Collections
Library     DateTime
# Test Setup      Open Browser    url=https://www.google.co.th/?hl=th    browser=chrome
# Test Teardown      Close Browser
# Suite Setup     Open Browser    url=https://www.ebay.com/    browser=chrome
# Suite Teardown  Close Browser
Test Setup      Log to console     ${EMPTY}
***Test Cases***
# Test  message
1.Test log message    #week 1
    [Tags]      Test
    Log     Test
    FOR     ${var}       IN      RANGE      50
        TRY 
            Log to console     ${var}
        EXCEPT
            Log to console     NotFile
        END
    END

2.open browser    #week 2
    [Tags]      xpath
    Open Browser    D://eke//TestOnline//Project_robbot//demo.html    browser=chrome     
    ${Text_free} =  Get text  //div[@name='ayako']/parent::div[@name='yuki']/span
    Log     ${Text_free}    console=yes
    Should be equal     ${Text_free}    Yuki
    Close Browser
3.Test list1
    [Tags]      list1
    ${list1} =      Create list      Hello       am      a      man
    ...     from       the      moon
# List นั้นใช้ Index สำหรับการเข้าถึงข้อมูล โดย Index ของ List จะเป็นจำนวนเต็มที่เริ่มจาก 0 และเพิ่มขึ้นทีละ 1
#  ไปเรื่อยๆ ดังนั้น เราจึงสามารถเข้าถึงข้อมูลภายใน List เพื่ออ่านหรืออัพเดทค่าได้โดยตรงผ่าน Index ของมัน  
# Index คือค่า เเสดง ที่อยู่ขิง List [index]โดย ค่า บวก จะเริ่มนับจาก ด้านหน้า ค่าลบจะนับจากด้านหลัง
    Log to console     All the box : ${list1}       #การกำหนดค่า หรือ เลือก ข้อมูล นำมาใช้ 
    Log to console     Box : ${list1}[4]
    Log to console     Box : ${list1}[-2]   
    Log to console     Test : ${list1}[4:6]
4.Test list2
# Append เป็นการเพิ่มข้อมูล ใน List นั้นๆโดยไม่ทับกับข้อมูลเก่า
# Should be equal เป็น การหาความเหมือนกันของข้อมูล
    [Tags]      list2
    ${list3} =      Create list      Hello
    ${len} =    Get Length     ${list3} 
    Append to list      ${list3}    low     dog
    Should be equal     ${len}    ${1}
    ${list4} =      Create list      Hello1  Hello2
    Append to list      ${list3}    ${list4}
    ${len1} =   Get Length     ${list3} 
    Should be equal     ${len1}    ${4}
    Log to console     Test : ${list3}[3][1]
5.Test time
    [Tags]      listtime
    ${Month}    ${year}=    Get current time
    Log to console     Month : ${Month}
    Log to console     year : ${year}
    #ค่า @ เป็น การนำข้อมูลภายใน List มาใช้
    #ค่า $ เป็น ค่าที่ นำข้อมูลก่อนนั้นมาใชงาน (คงค่าสถานะนั้น)
    # ตย. [1,2,3,4,5,6]   @ = 1,2,3,4,5,6 $=[1,2,3,4,5,6]
    @{current_date}=    Get current time
    Log to console     Month : ${current_date}[0]
    Log to console     year : ${current_date}[1]
    
    Should be equal     ${Month}    ${current_date}[0]
    Should be equal     ${year}    ${current_date}[1]
6.Test List3
    [Tags]      list3
    ${eq} =      Create list      hello     hello
    ${nq} =      Create list      NotFile   equal
    
    Should be equal     @{eq}
    Should be equal     ${eq}[0]    ${eq}[1]
    Should be equal     hello     hello
    Append to list      ${eq}    ${nq}
    Log to console      ${eq}

ึ7.Test Dictionary
    [Tags]      Dict
    &{Diction}   Create dictionary   Alabama=Montgomery
    ...   Alaska=Juneau
    ...   Arizona=Phoenix
    ...   Arkansas=Little Rock
    ...   California=Sacramento
    ...   Colorado=Denver
    ...   Connecticut=Hartford
    ...   Delaware=Dover
    ...   Florida=Tallahassee
    ...   Georgia=Atlanta
    ...   Hawaii=Honolulu
    ...   Idaho=Boise
    ...   Illinios=Springfield
    ...   Indiana=Indianapolis
    ...   Iowa=Des Monies
    ...   Kansas=Topeka
    ...   Kentucky=Frankfort
    ...   Louisiana=Baton Rouge
    ...   Maine=Augusta
    ...   Maryland=Annapolis
    ...   Massachusetts=Boston
    ...   Michigan=Lansing
    ...   Minnesota=St. Paul
    ...   Mississippi=Jackson
    ...   Missouri=Jefferson City
    ...   Montana=Helena
    ...   Nebraska=Lincoln
    ...   Neveda=Carson City
    ...   New_Hampshire=Concord
    ...   New_Jersey=Trenton
    ...   New_Mexico=Santa Fe
    ...   New_York=Albany
    ...   North_Carolina=Raleigh
    ...   North_Dakota=Bismarck
    ...   Ohio=Columbus
    ...   Oklahoma=Oklahoma City
    ...   Oregon=Salem
    ...   Pennsylvania=Harrisburg
    ...   Rhoda_Island=Providence
    ...   South_Carolina=Columbia
    ...   South_Dakoda=Pierre
    ...   Tennessee=Nashville
    ...   Texas=Austin
    ...   Utah=Salt Lake City
    ...   Vermont=Montpelier
    ...   Virginia=Richmond
    ...   Washington=Olympia
    ...   West_Virginia=Charleston
    ...   Wisconsin=Madison
    ...   Wyoming=Cheyenne   

    Log to console      ${Diction.Wyoming}




*** Keywords ***
Get current time
    ${current} =    DateTime.Get current date    result_format=datetime
    # Log to console    ${current}
    # Log to console    Month : ${current.month}
    # Log to console    Year : ${current.year}
    [Return]    ${current.month}    ${current.year}