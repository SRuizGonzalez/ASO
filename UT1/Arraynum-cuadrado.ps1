<#
.SYNOPSIS
        Script de ejemplo que crea un array con los números del 1 al 10 y muestra su cuadrado 

 .DESCRIPTION

        Crea un array con los números del 1 al 10 y muestra su cuadrado 


 .PARAMETER  [Nombre de Parametro]

        No hay ningun parametro

.EXAMPLE

        .\Arraynum-cuadrado.ps1

.NOTES

        Autor:   SAMUEL RUIZ
        Fecha:   06/10/2025
        Version:  1.0
#>
# Crea un array con los números del 1 al 10 y muestra su cuadrado 

$numeros = 1..10 

foreach ($num in $numeros) { 

    $cuadrado = [math]::Pow($num, 2) 

    Write-Output "El cuadrado de $num es $cuadrado"} 