*** Settings ***
Library  DataDriver  ./Data/data.csv
Test Template   Log desde xls

*** Test Case ***
Login con usuario ${username} y password ${password}
    
    
    

*** Keywords ***
Log desde xls
    [Arguments]  ${username}  ${password}  ${salida}
    Log To Console  ${username} ${password} ${salida}