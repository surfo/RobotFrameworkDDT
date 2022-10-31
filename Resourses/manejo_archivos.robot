*** Settings ***
Library  OperatingSystem



*** Keywords ***
Crear Archivo
    [Arguments]  ${pathFile}  ${contenido}
    Create File  ${pathFile}  ${contenido}

Valido existencia de Archivo
    [Arguments]  ${pathFile}
     Should Exist  ${pathFile}

Valido contenido
    [Arguments]  ${pathFile}  ${contenido}
    ${tmpcontenido} =  Get File  ${pathFile}
    Should Contain Any  ${tmpcontenido}  ${contenido}
