<#
.SYNOPSIS
        Script de ejemplo que suma numeros

 .DESCRIPTION

        Sumar numeros


 .PARAMETER  [Nombre de Parametro]

        No hay ningun parametro

.EXAMPLE

        .\Suma-Num.ps1

.NOTES

        Autor:   SAMUEL RUIZ
        Fecha:   06/10/2025
        Version:  1.0
#>
#Suma Numeros 

$suma = 0 

for ($i = 1; $i -le 100; $i++) { 

    $suma += $i 

} 

Write-Output "La suma de los numeros del 1 al 100 es:$suma" 
