## RobotFramwork + DDT 🚀


### ¿Qué son las pruebas basadas en datos?

La prueba basada en datos, también conocida como "DDT", es una forma de prueba de software. Los "datos" o "variables" utilizados en la prueba se almacenan en formato de tabla o de hoja de cálculo. Esto puede estar en un archivo XLS, XML o CSV.

![figra1](https://user-images.githubusercontent.com/55904664/199085411-a3a97762-31ca-4e9b-83d4-2943a76b5c4e.png)

### Entonces, ¿por qué usar pruebas basadas en datos?

Porque el Tester tiene múltiples conjuntos de datos para una sola prueba. Y la creación de pruebas individuales para cada conjunto de datos puede llevar mucho tiempo. DDT extrae los datos del script de prueba, y el mismo script de prueba se puede ejecutar para probar usando diferentes conjuntos de datos de entrada. además de ser capaz de generar resultados de prueba de manera efectiva

Ahora que sabemos qué es DDT, ¿cómo podemos implementar la implementación de DDT en Robot Framework?

Usaremos algo llamado "Plantilla de prueba (Test Template)" para ayudar a reducir las Keyworks que tienen argumentos duplicados y pasos de prueba en el script de automatizaciòn al darle a la Plantilla de prueba un nombre que coincida con el nombre de la palabra clave que se usará. 

5 Pasos para Scriptear basado en DDT

1. Instalar la biblioteca [DataDriver](https://robocorp.com/docs/libraries/3rd-party-libraries/datadriver-library#example-suite) para RF

DataDriver crea múltiples casos de prueba basados ​​en una plantilla de prueba y contenido de datos de un archivo CSV o Excel. Todas las pruebas creadas comparten la misma secuencia de prueba (palabras clave) y difieren en los datos de prueba. Debido a que estas pruebas se crean en tiempo de ejecución, solo se debe especificar la plantilla dentro de la especificación de prueba del robot y los datos utilizados se especifican en un archivo de datos externo.


```sh
pip install --upgrade robotframework-datadriver
```

2. Cree un archivo de estructura para que podamos leerlo y comprenderlo fácilmente. En el contexto Data el csv que contiene los datos de entrada y salidas esperadas

![Figura2](https://user-images.githubusercontent.com/55904664/199086121-ff2ee634-6021-47e6-bfcb-9e9e1b21703d.png)


3. Crear datos de prueba como un archivo CSV de acuerdo con este formato.

Data.csv
```sh
${username};${password};${salida};
"";"";Error Login: Username es requerido;
"";secret_sauce;Error Login: Username es requerido;
standard_user;secret_se;Error Login: Username y password inexistente;
locked_out_user;secret_sauce;Error Login: Usuario bloqueado;
standard_us;secret_sauce;Error Login: Username y password inexistente;
standard_us;secret_se;Error Login: Username y password inexistente;
```

4. Crear un archivo login.robot para definir variables para almacenar y definir keyworks.

```python
*** Settings ***
Library  DataDriver  ./Data/data.csv
Test Template   Log desde xls

*** Test Case ***
Login con usuario ${username} y password ${password}
    
    
    

*** Keywords ***
Log desde xls
    [Arguments]  ${username}  ${password}  ${salida}
    Log To Console  ${username} ${password} ${salida}
```

4. Ejecute este comando en la Terminal y vea el resultado.

```sh
robot -d Result DDT/login.robot
```
### Reporte
Es interesante que en el mismo nombre del test se usa los argumentos pasados desde el DataDriver que maneja la carga

![reporteRFDDT](https://user-images.githubusercontent.com/55904664/199089139-eedf4508-2bc5-4d37-97fa-4997afaeeeb1.png)


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


```python
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

```

## Comenzando 🚀

## Configurar Python 🔧
- Configurar variable de entorno "del sistema"  del S.O correspondiente 
- Validar la version
```sh
python --version
```

### En el caso de no tener instalado Python 
Descargar el instalador desde [aqui](https://www.python.org/downloads/) 

En el proceso de instalaciòn seleccionar la opciòn "Add Python 3.x to Path"

De lo contrario hay que agregar las variables de entorno de manera manual

.....python310/Scrips/

.....python310/


- De ser necesario actualizar el pip
```sh
python.exe -m pip install --upgrade pip --trusted-host pypi.org --trusted-host files.pythonhosted.org --user
```

### Instalar Visual Studio Code

1- Descargar el [Instalador del IDE](https://code.visualstudio.com/) acorde el SO

2- Ejecutar el instalador que nos descargò.

3- Instalar los complementos de RobotFramework

Buscar Robocorp y seleccionar 
* Robot Framework Languaje Server 
* Robotcorp code

Luego de instalar el plugin de Robot Framework Languaje ir a la seccion de Settins buscar los apartados 
* Robot > Python: Ejecutable(Executable)
* Robot > Languaje-server: Python

Colocar en ambos el path del .exe de Python

Ejemplo: C:\Users\user_aaa\AppData\Local\Programs\Python\Python310\python.exe



### Descargar el proyecto completo

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
Correr Tags especificos (-i included -e excluded)
```console
robot -i tagsNombre
```

## Despliegue 📦
Jenkins

## Construido con 🛠️

Libreria desarrollo personalizado equipo Automatizacion en Python

RobotFramework

## RobotFramwork



