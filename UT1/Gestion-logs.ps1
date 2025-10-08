<#
.SYNOPSIS
        Script de ejemplo que crea una carpeta logs en Documentos
 .DESCRIPTION

        Crea una carpeta logs en Documentos


 .PARAMETER  [Nombre de Parametro]

        No hay ningun parametro

.EXAMPLE

        .\Gestiona-logs.ps1

.NOTES

        Autor:   SAMUEL RUIZ
        Fecha:   06/10/2025
        Version:  1.0
#>
# Gestion-Log.ps1 

# Crea una carpeta "Logs" en la carpeta Documentos del usuario. 

# Dentro de ella crea 10 ficheros vacíos: log1.txt, log2.txt, ..., log10.txt 

  

# Obtener la ruta de Documentos del usuario 

$rutaDocumentos = [Environment]::GetFolderPath("MyDocuments") 

  

# Definir la ruta de la carpeta Logs 

$rutaLogs = Join-Path $rutaDocumentos "Logs" 

  

# Crear la carpeta Logs si no existe 

if (-not (Test-Path $rutaLogs)) { 

    New-Item -ItemType Directory -Path $rutaLogs | Out-Null 

    Write-Host "Carpeta 'Logs' creada en: $rutaLogs" 

} else { 

    Write-Host "La carpeta 'Logs' ya existe en: $rutaLogs" 

} 

  

# Crear los 10 ficheros vacíos log1.txt, log2.txt, ..., log10.txt 

for ($i = 1; $i -le 10; $i++) { 

    $nombreFichero = "log$i.txt" 

    $rutaFichero = Join-Path $rutaLogs $nombreFichero 

  

    # Crear el archivo solo si no existe 

    if (-not (Test-Path $rutaFichero)) { 

        New-Item -ItemType File -Path $rutaFichero | Out-Null 

        Write-Host "Creado: $nombreFichero" 

    } else { 

        Write-Host "El archivo $nombreFichero ya existe." 

    } 

} 