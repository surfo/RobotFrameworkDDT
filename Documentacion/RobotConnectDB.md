##Install DatabaseLibrary module by

pip install robotframework-databaselibrary

##Instalar modulo de JayDeBeApi (Opcional)

pip install JayDeBeApi

Las ubicaciòn de las librerias puede ser Python\Lib\site-packages

Como usar el modulo JayDeBeApi

connection:

`Connect To Database Using Custom Params | JayDeBeApi | 'oracle.jdbc.driver.OracleDriver', 'my_db_test', 'system', 's3cr3t'
`


Uso del DatabaseLibrary


`*** Settings ***
Documentation  Keywords basicos para uso de la libreria
Library  DatabaseLibrary

*** Variables ***
${DB_CONNECT_STRING} =  'user/mypasswd@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=myipaddress)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=mysid)))'

*** Test Cases ***
Connecting
  connect

  @{queryResults}  Query  select * from table t where id_table =1001

  log to console  @{queryResults}

*** Keywords ***
Connect
    connect to database using custom params  cx_Oracle  ${DB_CONNECT_STRING}

Disconnect
    disconnect from database`