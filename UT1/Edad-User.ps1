<#
.SYNOPSIS
        Script de ejemplo que crea la edad del usuario

 .DESCRIPTION

        Edad del usuario


 .PARAMETER  [Nombre de Parametro]

        No hay ningun parametro

.EXAMPLE

        .\Edad-User.ps1

.NOTES

        Autor:   SAMUEL RUIZ
        Fecha:   06/10/2025
        Version:  1.0
#>
#Pedir Edad 

$edad = Read-Host "Introduce tu edad" 


#Evaluar la condicion 

if ([INT]$edad -ge 18) { 

    Write-Output "Mayor de edad" 

} else { 

    Write-Output "Menor de edad" 

} 
