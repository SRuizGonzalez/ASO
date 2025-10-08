<#
.SYNOPSIS
        Script de ejemplo que saluda a los arrays

 .DESCRIPTION

        Crea un array con 5 nombres y los muestra con un saludo


 .PARAMETER  [Nombre de Parametro]

        No hay ningun parametro

.EXAMPLE

        .\Pinta-Array.ps1

.NOTES

        Autor:   SAMUEL RUIZ
        Fecha:   06/10/2025
        Version:  1.0
#>
# Crea un array con 5 nombres y los muestra con un saludo personalizado 

$nombres = @("Ana", "Luis", "Carlos", "Maria", "Sofia") 

foreach ($nombre in $nombres) { 

    Write-Output "Hola, $nombre"} 