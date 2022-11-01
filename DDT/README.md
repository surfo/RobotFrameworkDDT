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

2. Crear un proyecto con estructura simple para que podamos leerlo y comprenderlo fácilmente. En el contexto Data el csv que contiene los datos de entrada y salidas esperadas

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

```sh
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

4. Ejecutar este comando en la Terminal y vea el resultado.

```sh
robot -d Result DDT/login.robot
```
### Reporte
En la columna name del test se usa los argumentos pasados desde el DataDriver que maneja la carga, cada iteracion de la fila del input (csv o xls) es un test independiente.

![reporteRFDDT](https://user-images.githubusercontent.com/55904664/199089139-eedf4508-2bc5-4d37-97fa-4997afaeeeb1.png)


