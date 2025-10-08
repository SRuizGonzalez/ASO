<#
.SYNOPSIS
        Script de ejemplo que crea una tabla de multiplicar

 .DESCRIPTION

        Tabla de multiplicar


 .PARAMETER  [Nombre de Parametro]

        No hay ningun parametro

.EXAMPLE

        .\Tabla-Multiplicar.ps1

.NOTES

        Autor:   SAMUEL RUIZ
        Fecha:   06/10/2025
        Version:  1.0
#>
#Tabla de multiplicar 

for ($i = 1; $i -le 10; $i++) { 

    $resultado = 5 * $i 

    Write-Output "5 x $i = $resultado" 

} 