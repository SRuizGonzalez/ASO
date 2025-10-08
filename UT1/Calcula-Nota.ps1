<#
.SYNOPSIS
        Script de ejemplo que crea una nota y dice si esta aprobao o suspenso
 .DESCRIPTION

        Crea una nota y dice si esta aprobao o suspenso


 .PARAMETER  [Nombre de Parametro]

        No hay ningun parametro

.EXAMPLE

        .\Calcula-Nota.ps1

.NOTES

        Autor:   SAMUEL RUIZ
        Fecha:   06/10/2025
        Version:  1.0
#>
# Pide una nota numérica (0–10) y muestra la calificación correspondiente 

$nota = [int](Read-Host "Introduce una nota (0-10)") 

if ($nota -ge 9 -and $nota -le 10) { 

    Write-Host "Sobresaliente"} 

elseif ($nota -ge 7 -and $nota -le 8) { 

    Write-Host "Notable"} 

elseif ($nota -ge 5 -and $nota -le 6) { 

    Write-Host "Aprobado"} 

elseif ($nota -ge 0 -and $nota -le 4) { 

    Write-Host "Suspenso"} 

else { 

    Write-Host "La nota no es válida. Debe estar entre 0 y 10."} 