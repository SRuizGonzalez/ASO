<#
.SYNOPSIS
        Script de ejemplo que crea una carpeta y dice si es par o impar

 .DESCRIPTION

        Crea una carpeta y dice si es par o impar

 .PARAMETER  [Nombre de Parametro]

        No hay ningun parametro

.EXAMPLE

        .\Crear-Carpetas.ps1

.NOTES

        Autor:   SAMUEL RUIZ
        Fecha:   06/10/2025
        Version:  1.0
#>
#Pide un número al usuario.  

#Si es par, crea una carpeta llamada Pares.  

#Si es impar, crea una carpeta llamada Impares. 

# Pedir número al usuario 

$numero = Read-Host "Introduce un numero" 

# Comprobar si es par o impar 

if ($numero % 2 -eq 0) { 

    # Si es par 

    $carpeta = "Pares"}  

else { 

    # Si es impar 

    $carpeta = "Impares"}  