## RobotFramwork 🚀

Robot Framework es un marco de automatización genérico de código abierto. Se puede utilizar para la automatización de pruebas y la automatización de procesos robóticos [(RPA)](https://www.automationanywhere.com/la/rpa/robotic-process-automation).

Los .robot se dividen internamente en secciones (Settings, Variables, Test Cases, Task, Keyworks, Comments)
Cada seccion se puede alojar en una carpeta
    - Web
    - Batch
    - API
    - DB

### *** Settings *** 🛠️

[Documentation]  Documentacion acerca del proyecto de automatización

[Library]  Librerias que se van a utilizar en el proyecto pueden ser Standard, External o propias

[Resource]  Algun archivo .robot para reutilizar 

[Suite Setup/Suite] Teardown  es como un Before ejecución/Later ejecución 

[Test Setup/Test Teardown]  para declarar alguna variable global dentro del archivo .robot

[Test Timeout x] representa cuanto tiempo esperara la ejecución de cada caso


### *** Variables *** 📋
Se crean las variables:

${variable1} variable estandar

${GLOBAL} =  Variable Global 



@{lista} lista


### *** Test Cases *** 🔩

Donde se escriben los casos de pruebas
Puede contener [Documentation] alguna documentacion acerca del test

[Tags] etiquetas para poder ejecutar por linea de comando por conjunto de tags ej. "smoke"

[Timeout] x Opcional para declarar un tiempo de espera especifico segun el caso  

Es ideal que la estructura de los casos de pruebas tengan esta estructura:

Nombre del caso de pruebas, literal asi sale en el reporte

Pre-condiciones

    Keywords el setup del caso
steps

    Pasos que detallan el caso
Post-condiciones

    Cerrar el caso

Declaracion de distintos tipos de variables:

Set Test Variable  ${Variable1}   Esta variable estara solo dentro de la prueba

Set Suite Variable  ${Variable2}   Esta variable estara para todos los casos de prueba en el conjunto de pruebas que se esta ejecutando

Set Global Variable  ${VARIABLE3}   Esta variable sera Global



### Particularidades Test Case:
#### Correr un Keyword ignorando si falla
```python
Run Keyword And Continue On Failure  Hacer test keyword
```

#### Correr un Keyword 3 veces
```python
Repeat Keyword  3 Time  Hacer test Keyword
```



### *** Task ***
Creación de tareas utilizando palabras clave disponibles. Un solo archivo solo puede contener pruebas o tareas.

### *** Keywords *** ⚙️
Se desarrollan en un nivel inferior acciones mediante palabras claves, pueden ser utilizadas desde cualquier dominio de pruebas
Se pueden pasar parametros mediante [Arguments]

Ejemplo:

Inicio Browser

    [Arguments] ${START_URL}  ${BROWSER}

    Open Browser  ${START_URL}  ${BROWSER}

Para invocar el Keywords desde otro .robot en un Test Cases seria:
Usuario Ingresa a Home

    Inicio Browser  www.google.com  ie


### *** Comments ***
Comentarios o datos adicionales. Ignorado por Robot Framework.

### Practica
[Ejemplo](https://robotframework.org/code?example=Simple%20Example)



### FrontEnd
En el caso que se utilice las librerias de Selenium se puede estructurar el proyecto POM


/ProyectoBase

    ./Test  # contiene todos scripts con sus casos de pruebas (.robot)

    ./Resourses  # Palabras claves, Page Objects

        ../PO

    ./libraries  # Librerias desarrollo propio

    ./Results  # Reportes


## Web
### En el caso que se utilice las librerias de Selenium se puede estructurar el proyecto POM


### API
```sh
python -m pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org pip install robotframework-requests
```
```sh
python -m pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org pip install robotframework-extendedrequestslibrary
```

### Ejemplo API
*** Settings ***
Library  RequestsLibrary

*** Test Cases ***


Quick Get Request Test
    ${response}=    GET  https://www.google.com  verify=${False}

Quick Get Request With Parameters Test
    ${response}=    GET  https://www.google.com/search   verify=${False}  params=query=ciao  expected_status=200

Quick Get A JSON Body Test
    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1  verify=${False}
    Should Be Equal As Strings    1  ${response.json()}[id]



## Comenzando 🚀

## Configurar Python 🔧
- Configurar variable de entorno "del sistema"  del S.O correspondiente 
- Validar la version
```sh
python --version
```

--- De no tener instalado Python 
Descargar el instalador desde [text](https://www.python.org/downloads/) variable de entorno


.....python310/Scrips/
.....python310/

Configurar

- De ser necesario actualizar el pip
```sh
python.exe -m pip install --upgrade pip --trusted-host pypi.org --trusted-host files.pythonhosted.org --user
```

### Instalar Visual Studio Code

1- Descargar el [Instalador del IDE](https://code.visualstudio.com/) acorde el SO

2- Ejecutar el instalador que nos descargò.

3- Instalar los complementos de Robot Framework Languaje Server y Robot Framework Intellisense



Descargar el proyecto completo

`> git clone https://github.com/surfo/test_Batch.git`

`> git checkout usr_git`

Subir modificaciones del Proyecto de Automatización

1.-Bajar las novedades del repo remoto


`> git pull`

2.- Validar los archivos que se modificaron localmente


`> git status`

3.- Subir todas las modificaciones

`> git add .`

4.- Realizar el commit

`> git commit -m "descripción corta de lo que se esta subiendo"`

5.- Realizar el push

`> git push`

Listo calisto!!

## Proceso de inicio Python

## pip install

Por posible error en el modulo pip (solución)
python -m ensurepip --user



### Robot Framework 
```sh
python -m pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org robotframework
```
o

```sh
pip install robotframework
```

# Actualizar
```sh
pip install --upgrade robotframework
```

### RPA RobotFramework
```sh
python -m pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org rpa-framework
```


### Assertions Robotframework [Ver](https://pypi.org/project/robotframework-assertion-engine/)

```sh
python -m pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org robotframework-assertion-engine
```


### Instalar Libreria numpy
```sh
python -m pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org numpy
```
o

```sh
pip install numpy
```

## Configuración para destino reporte 📖
robot --outputdir results/Reporte%date:~-4,4%%date:~-10,2%%date:~-7,2% --timestampoutputs

## Ejecutando las Pruebas ⚙️
## Correr RobotFramework por linea de comando 🖇️

Para ejecutar una suite de test Case, posicionar la ubicacion donde contiene los .robot y ejecutar mediante el comando
```console
robot .
```
o

cmd raiz del proyecto
```console
C:/raiz/proyecto/robot -d Results Test .
```

Para pasar una variable mediante comando
```console
robot -v VARIABLE:valor 
```
Tantas veces sea necesario pasar varibles desde afuera -v

Ejecutar Tags especificos, por ejemplo en el directorio test
```console
robot -i current test
```

Especificar donde alojar el reporte
```console
robot -d results
```
Correr Tags especificos
```console
robot -t tagsNombre
```

## Despliegue 📦
Jenkins

## Construido con 🛠️

Libreria desarrollo personalizado equipo Automatizacion en Python

RobotFramework

## RobotFramwork



