*** Settings ***
Library  DatabaseLibrary
Test Teardown    Disconnect db
Test setup   Run Keywords     Connect to db
AND   Log to console     aaaaa
*** Variables ***
${connection_string}=    '125.26.15.143:1433','sa','MyPass@word'
${db_type}=    pymssql

*** Keywords ***
Connect to db
    DatabaseLibrary.Connect To Database Using Custom Params    ${db_type}    ${connection_string}  
    Log to console    Connected to db successfully

Disconnect db
    DatabaseLibrary.Disconnect From Database
    Sleep    3s  # Makesure disconnect properly
    Log to console    Disconnected Database successfully 

*** Test Cases ***
Test01 Select Asset
    [Tags]    001
    Connect to db
    #Select asset
    ${query}=   catenate     INSERT INTO [master].[dbo].[Assets]
    ...                      VALUES (26,123,'Nakarin  Sue',1000,'Active')
    @{result}=      DatabaseLibrary.Execute Sql String      ${query}

    ${query}=   catenate   SELECT * 
    ...                    FROM master.dbo.Assets
    ...                    Where asset_id = 26
    @{result}=      DatabaseLibrary.Query   ${query}

     Log to console         ${result}
    ${result_row1}=    Set Variable    @{result}[0]
    Log to console      ${result_row1}
    Should be equal as strings    ${result_row1}[0]     26
    Should be equal as strings    ${result_row1}[3]     1000
    Should be equal as strings    ${result_row1}[4]     Active
Test02 Update 
    [Tags]    002
    ${query}=       catenate    Update master.dbo.Assets
    ...                         Set asset_type=2000, active = 'Inactive'
    ...                         where asset_id = 26
    @{result}=      DatabaseLibrary.Execute Sql String    ${query}

Test03 Delete Asset
    [Tags]    003
    ${query}=       catenate    DELETE master.dbo.Assets
    ...                         where asset_id = 26
    @{result}=      DatabaseLibrary.Execute Sql String    ${query}
    ${query}=       catenate    Select *
    ...                         from master.dbo.Assets
    ...                         where asset_id = 26
    @{result}=      DatabaseLibrary.Query    ${query}
    Log to console      ${result}
    Should be empty      ${result}    
