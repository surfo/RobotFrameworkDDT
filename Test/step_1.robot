*** Settings ***
Resource  ../Resourses/manejo_archivos.robot

*** Variables ***
${PATH}  ${CURDIR}/ejemplo.txt

*** Test Cases ***
Crear Archivo
    manejo_archivos.Crear Archivo  ${PATH}  Hola

Valido archivo
    manejo_archivos.Valido existencia de Archivo  ${PATH}
    manejo_archivos.Valido contenido  ${PATH}  Hola

Borro Archivo
    Remove File  ${PATH}