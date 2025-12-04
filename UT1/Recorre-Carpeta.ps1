<#
.SYNOPSIS
        Script de ejemplo que recorre carpetas
 .DESCRIPTION

        Recorre Carpeta


 .PARAMETER  [Nombre de Parametro]

        No hay ningun parametro

.EXAMPLE

        .\Recorre-Carpeta.ps1

.NOTES

        Autor:   SAMUEL RUIZ
        Fecha:   06/10/2025
        Version:  1.0
#>

# Ruta de la carpeta a recorrer
$carpeta = "D:\imagenes\ASO SCRIPT\Archivos"

# Recorrer todos los archivos de la carpeta
Get-ChildItem -Path $carpeta -File | ForEach-Object {
    switch ($_.Extension.ToLower()) {
        ".csv" {
            Write-Host "$($_.Name)  .csv:Es un fichero de datos"
        }
        ".docx" {
            Write-Host "$($_.Name)  .docx:Es un documento de texto"
        }
        ".png" {
            Write-Host "$($_.Name)  .png:Es una imagen"
        }
        default {
            Write-Host "$($_.Name) default: Tipo de archivo no especificado"
        }
    }
}