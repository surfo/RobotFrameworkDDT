## Instalar modulo DatabaseLibrary

```console
pip install robotframework-databaselibrary
```

## Instalar modulo de JayDeBeApi (Opcional)

```console
pip install JayDeBeApi
```

Las ubicaciòn de las librerias puede ser Python\Lib\site-packages

Como usar el modulo JayDeBeApi

connection:

`Connect To Database Using Custom Params | JayDeBeApi | 'oracle.jdbc.driver.OracleDriver', 'my_db_test', 'system', 's3cr3t'
`


### Uso del DatabaseLibrary

```robotframework
*** Settings ***

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
    disconnect from database
```

## Libreria Conexión remota de Python a la base de datos Oracle en el servidor

Instalar cliente Oracle Basic Package
[Ingresar](https://www.oracle.com/database/technologies/instant-client/downloads.html)

```console
pip install cx_Oracle --user
```

```console
python -m pip install cx_Oracle --upgrade
```
