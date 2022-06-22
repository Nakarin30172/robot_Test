*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  DebugLibrary
Resource   ${CURDIR}/../Keywords/asset_api/asset_keyword.robot
Library    ${CURDIR}/Testbase64.py

Test Setup      Log to console     ${EMPTY}
*** Variables ***
${api_root_endpoint}    http://125.26.15.143:8082/assets
# ${api_root_endpoint}    http://125.26.15.143:8082/
*** Test Cases ***
TC001 Get all assets
    [Tags]    001
    # RequestsLibrary.Create session    alias=get_asset    url=${api_root_endpoint}
    # ${response}=    RequestsLibrary.Get on session     alias=get_asset     url=/assets      expected_status=200
    ${response}=    RequestsLibrary.Get     url=${api_root_endpoint}      expected_status=200
    Log to console   ${response.json()}
    BuiltIn.Should be equal as strings     ${response.status_code}        200
    
    #Check if 'Get All Assets service return data contain assetId = a1
    ${asset_data}    JSONLibrary.Get value from json       ${response.json()}     $[?(@.assetId=='a1')]
    log to console  ${asset_data}
    ${asset_id}    JSONLibrary.Get value from json    ${asset_data}   $..assetId
    log to console  ${asset_id}
    BuiltIn.Should be equal as strings    ${asset_id}[0]    a1

#Workshop in class
TC002 Create a new asset
    [Documentation]    Create new asset by define body with dictionary
    [Tags]    002

    ${json_request_body}=  Create dictionary   assetId=Nakarin_6     assetName=Sueakanong     assetType=1     inUse=${True}
    ${response}=  RequestsLibrary.Post        url=${api_root_endpoint}        expected_status=200     json=${json_request_body}
    Debug
    Log to console      ${response.json()}
    ${status}=      JSONLibrary.Get value from json     ${response.json()}     $..status
    BuiltIn.Should be equal as strings    ${status}[0]    success


    ${response}=    RequestsLibrary.Get     url=${api_root_endpoint}    expected_status=200
    ${asset_data}   JSONLibrary.Get value from json     ${response.json()}     $[?(@.assetId=='Nakarin_6')]

    log to console      ${asset_data}
    BuiltIn.Should Not Be Empty   ${asset_data}
    ${asset_name}       JSONLibrary.Get value from json     ${asset_data}       $..assetName
    ${asset_type}       JSONLibrary.Get value from json     ${asset_data}       $..assetType
    ${asset_is_use}     JSONLibrary.Get value from json     ${asset_data}       $..inUse
    BuiltIn.Should be equal as strings    ${asset_name}[0]    Sueakanong
    BuiltIn.Should be equal as strings    ${asset_type}[0]    ${1}
    BuiltIn.Should be equal as strings    ${asset_is_use}[0]    ${True}





TC003 Create a new asset using keyword
    [Documentation]    Create new asset by define body with user define keyword
    [Tags]    003
    # debug
    ${response}=    RequestsLibrary.Get     url=${api_root_endpoint}    expected_status=200
    ${asset_data}   JSONLibrary.Get value from json     ${response.json()}     $[?(@.assetId=='Nakarin_6')]
    ${asset_data1}   Convert To String   ${asset_data} 
    ${data1}    Testbase64.decode       ${asset_data1}   
    log to console    Decode : ${data1}
    ${data2}    Testbase64.encode      ${data1} 
    log to console    encode : ${data2}
TC004 Modify the existing asset
    [Documentation]    Modify asset by edit json template file
    [Tags]    004


TC005 Delete asset by id
    [Documentation]    Delete asset by asset id
    [Tags]    005




