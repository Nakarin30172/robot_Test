***Settings***
Library     SeleniumLibrary
Library     Collections
Library     DateTime
# Test Setup      Open Browser    url=https://www.google.co.th/?hl=th    browser=chrome
# Test Teardown      Close Browser
# Suite Setup     Open Browser    url=https://www.ebay.com/    browser=chrome
# Suite Teardown  Close Browser
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

    @{current_date}=    Get current time
    Log to console     Month : ${current_date}[0]
    Log to console     year : ${current_date}[1]
    
    Should be equal     ${Month}    ${current_date}[0]
    Should be equal     ${year}    ${current_date}[1]

*** Keywords ***
Get current time
    ${current} =    DateTime.Get current date    result_format=datetime
    # Log to console    ${current}
    # Log to console    Month : ${current.month}
    # Log to console    Year : ${current.year}
    [Return]    ${current.month}    ${current.year}