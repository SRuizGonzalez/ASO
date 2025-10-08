<#
.SYNOPSIS
        Script de ejemplo que recorre ficheros
 .DESCRIPTION

        Recorre ficheros


 .PARAMETER  [Nombre de Parametro]

        No hay ningun parametro

.EXAMPLE

        .\Recorre-ficheros.ps1

.NOTES

        Autor:   SAMUEL RUIZ
        Fecha:   06/10/2025
        Version:  1.0
#>
# Recorre-Ficheros.ps1
# Escribe dentro de cada fichero en la carpeta Logs:
# “Este es el fichero logX.txt”
# Luego recorre los ficheros y muestra en pantalla la primera línea de cada uno.

# Obtener la ruta de la carpeta Documentos del usuario
$rutaDocumentos = [Environment]::GetFolderPath("MyDocuments")

# Definir la ruta de la carpeta Logs
$rutaLogs = Join-Path $rutaDocumentos "Logs"

# Verificar que la carpeta Logs existe
if (-not (Test-Path $rutaLogs)) {
    Write-Host "La carpeta 'Logs' no existe. Ejecute primero 'Gestion-Log.ps1'."
    exit
}

# Escribir texto dentro de cada fichero logX.txt
for ($i = 1; $i -le 10; $i++) {
    $nombreFichero = "log$i.txt"
    $rutaFichero = Join-Path $rutaLogs $nombreFichero

    if (Test-Path $rutaFichero) {
        "Este es el fichero $nombreFichero" | Out-File -FilePath $rutaFichero -Encoding UTF8
    } else {
        Write-Host "No se encontro $nombreFichero, se omitira."
    }
}

# Recorrer los ficheros y mostrar la primera línea de cada uno
Write-Host "`n===== CONTENIDO DE LOS FICHEROS ====="
foreach ($fichero in Get-ChildItem -Path $rutaLogs -Filter "log*.txt") {
    $primeraLinea = Get-Content $fichero.FullName -TotalCount 1
    Write-Host "$($fichero.Name): $primeraLinea"
}