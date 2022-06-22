*** Settings *** 
Library         AppiumLibrary
*** Variables ***
${appium_page.btn_employer_group}      id=headerButton3
${appium_page.btn_home_page}           xpath=//android.widget.TextView
${appium_page.btn_name}                id=net.appsynth.seveneleven:id/
****Keywords***
wait and Tap
    [arguments]     ${location}
    Wait until element is visible         ${location}         timeout=30s
    Tap          ${location}

*** Test Cases ***
Open app
    Open application        remote_url=http://localhost:4723/wd/hub                 
    ...                     platformName=android            
    ...                     platformVersion=12
    ...                     deviceName=emulator-5554
    ...                     app=${CURDIR}\\7-appmobile.apk
    ...                     appActivity=net.appsynth.allmember.main.presentation.splash.SplashActivity
TC1 cancelpopup
    wait and Tap         ${appium_page.btn_name}tutorialCloseImageView
    wait and Tap         ${appium_page.btn_name}mktCancelBtn
    wait and Tap         ${appium_page.btn_name}popupCouponCancelBtn
Tc2 
    wait and Tap         xpath=//android.widget.TextView[@resource-id='net.appsynth.seveneleven:id/homeMenuTitle' and @text='ช้อป All Online']    
    wait and Tap         xpath=//android.widget.TextView[@content-desc="ค้นหา"]
    Wait until element is visible          ${appium_page.btn_name}search         timeout=30s
    Input text           id=net.appsynth.seveneleven:id/search      smooth e     
    wait and Tap         xpath=//android.widget.TextView[@resource-id='net.appsynth.seveneleven:id/searchSuggestionItem' and @text='smooth e']





    # Wait until element is visible          id=net.appsynth.seveneleven:id/tutorialCloseImageView         timeout=30s
    # Tap              id=net.appsynth.seveneleven:id/tutorialCloseImageView
    
    # Wait until element is visible          id=net.appsynth.seveneleven:id/mktCancelBtn         timeout=30s
    # Tap              id=net.appsynth.seveneleven:id/mktCancelBtn
    
    # Wait until element is visible          id=net.appsynth.seveneleven:id/popupCouponCancelBtn         timeout=30s
    # Tap              id=net.appsynth.seveneleven:id/popupCouponCancelBtn

    # Wait until element is visible           xpath=//android.widget.TextView[@resource-id='net.appsynth.seveneleven:id/homeMenuTitle' and @text='เธ�เน�เธญเธ� All Online']          timeout=30s
    # Tap                 xpath=//android.widget.TextView[@resource-id='net.appsynth.seveneleven:id/homeMenuTitle' and @text='เธ�เน�เธญเธ� All Online'] 










    # Wait until element is visible           //*[@resource-id='net.appsynth.seveneleven:id/action_home' and @content-desc='เธซเธ�เน�เธฒเธซเธฅเธฑเธ�'] 
    # Tap             //*[@resource-id='net.appsynth.seveneleven:id/action_home' and @content-desc='เธซเธ�เน�เธฒเธซเธฅเธฑเธ�'] 
    
