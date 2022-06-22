*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary

*** Keywords ***
Create a new asset
    [Arguments]     ${url}    ${id}    ${name}    ${type}    ${inuse}
    ${request_body}=    Create dictionary    assetId=${id}    assetName=${name}
    ...     assetType=${type}   inUse=${inuse}
    ${response}=    RequestsLibrary.Post    url=${url}   json=${request_body}
    ...     expected_status=200
    [Return]   ${response}

Verify status shoud be success
    [Arguments]   ${json_response}
    ${status}    JSONLibrary.Get value from json    ${json_response}   $..status
    Builtin.Should be equal as strings    ${status}[0]    success

Verify status code shoud be equal
    [Arguments]   ${response}       ${expected_status_code}
    Should be equal as strings      ${response}    ${expected_status_code}

Create asset with template
    [Arguments]     ${url}    ${asset_id}    ${asset_name}     ${asset_type}=${1}     ${in_use}=${False}    ${exprected_status_code}=200
    RequestsLibrary.Create session    alias=create_new_asset   url=${url}
    ${request}=     JSONLibrary.Load JSON From File    ${CURDIR}/resources/create_asset.json
    ${request}=    JSONLibrary.Update Value To Json    ${request}    $..assetId    ${asset_id}
    ${request}=    JSONLibrary.Update Value To Json    ${request}    $..assetName    ${asset_name}
    ${request}=    JSONLibrary.Update Value To Json    ${request}    $..assetType    ${asset_type}
    ${request}=    JSONLibrary.Update Value To Json    ${request}    $..inUse    ${in_use}
    ${response}=    RequestsLibrary.Post    ${url}    json=${request}
    ...    expected_status=${exprected_status_code}

Get all assets of asset id
    [Arguments]    ${url}    ${id}
    ${response}=   RequestsLibrary.Get    url=${url}    expected_status=200
    ${asset_id_data}    JSONLibrary.Get value from json       ${response.json()}     $[?(@.assetId=='${id}')]
    [Return]    ${asset_id_data}

Verify asset is created
    [Arguments]   ${asset_id_data}
    BuiltIn.Should Not Be Empty    ${asset_data}

Verify asset data should be
    [Arguments]    ${asset_data}    ${exp_asset_name}     ${exp_asset_type}     ${exp_in_use}
    BuiltIn.Should Not Be Empty    ${asset_data}
    ${asset_name}    JSONLibrary.Get value from json    ${asset_data}   $..assetName
    ${asset_type}    JSONLibrary.Get value from json    ${asset_data}   $..assetType
    ${asset_in_use}    JSONLibrary.Get value from json    ${asset_data}   $..inUse
    BuiltIn.Should be equal as strings    ${asset_name}[0]    ${exp_asset_name}
    BuiltIn.Should be equal as strings    ${asset_type}[0]    ${exp_asset_type}
    BuiltIn.Should be equal as strings    ${asset_in_use}[0]    ${exp_in_use}