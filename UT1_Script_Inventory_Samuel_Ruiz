<#
.SYNOPSIS
  Inventario PowerShell adaptado a los apartados que nos pide el documento UT1_Practica1_PS.

.DESCRIPTION
  Versión intermedia del script de inventario con:
  - Parametrización de rutas
  - Comprobación y creación de carpetas
  - Test de escritura real
  - Mensajes informativos
  - Log básico con niveles
  - Manejo de monitores tolerante
  - Inicialización y control de errores
  - Soporte para rutas compartidas y fallback a Documentos
#>

param(
  [string]$OutputPath = "D:\Usuarios\ASR210\Downloads\UT1",
  [string]$LogPath = "D:\Usuarios\ASR210\Downloads\UT1",
  [string]$SessionCode = "UT1_P1_SamuelRuiz"
)

# ---------------------------
# Función: Write-Log
# ---------------------------
function Write-Log {
  param(
    [ValidateSet("INFO","WARN","ERROR")][string]$Level = "INFO",
    [string]$Message
  )
  $timestamp = Get-Date -Format "2025-11-10 11:16:37"
  $line = "[$timestamp] $Level $env:COMPUTERNAME $SessionCode $Message"

  try {
    if (-not (Test-Path $LogPath)) {
      New-Item -ItemType Directory -Path $LogPath -Force | Out-Null
    }
    $logFile = Join-Path $LogPath "UT1_Practica1-$SessionCode-log.txt"
    Add-Content -Path $logFile -Value $line
  } catch {
    Write-Warning "No se pudo escribir en el log ($LogPath)."
  }
}

# ---------------------------
# Función: Test-WriteAccess
# ---------------------------
function Test-WriteAccess {
  param([string]$Folder)
  try {
    $testFile = Join-Path $Folder ("test_{0}.tmp" -f ([guid]::NewGuid().ToString()))
    Set-Content -Path $testFile -Value "test" -ErrorAction Stop
    Remove-Item -Path $testFile -Force -ErrorAction SilentlyContinue
    return $true
  } catch {
    return $false
  }
}

# ---------------------------
# Comprobación de rutas de salida y log
# ---------------------------
Write-Host "Comprobando rutas de salida..."

if (-not (Test-Path $OutputPath)) {
  try {
    New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
    Write-Log -Level "INFO" -Message "Creada ruta de salida: $OutputPath"
  } catch {
    Write-Warning "No se pudo crear la ruta de red. Usando Documentos como alternativa."
    $OutputPath = Join-Path $env:USERPROFILE "Documents\Practica_PS"
    if (-not (Test-Path $OutputPath)) {
      New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
    }
    Write-Log -Level "WARN" -Message "Usando ruta alternativa local: $OutputPath"
  }
}

if (-not (Test-WriteAccess $OutputPath)) {
  Write-Warning "No se puede escribir en $OutputPath. Se usara Documentos."
  $OutputPath = Join-Path $env:USERPROFILE "Documents\Practica_PS"
  if (-not (Test-Path $OutputPath)) { New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null }
  Write-Log -Level "WARN" -Message "Fallback a Documentos: $OutputPath"
}

if (-not (Test-Path $LogPath)) {
  New-Item -ItemType Directory -Path $LogPath -Force | Out-Null
}

$csvFile = Join-Path $OutputPath "$env:COMPUTERNAME-Inventory.csv"
Write-Log -Level "INFO" -Message "Archivo de inventario: $csvFile"

# ---------------------------
# Recolección de información
# ---------------------------
Write-Host "Obteniendo informacion del sistema..."

# Fecha
$Date = Get-Date -Format "2025-11-10 11:16:37"
$Username = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$Hostname = $env:COMPUTERNAME
$infoColl = @()

# Inicializamos variables con "N/A" para evitar errores si algo falla
$BIOS = "N/A"
$CPU = "N/A"
$RAM = "N/A"
$Storage = "N/A"
$GPU0 = "N/A"
$GPU1 = "N/A"
$Model = "N/A"
$SN = "N/A"
$IP = "N/A"
$MAC = "N/A"
$Monitor1 = "N/A"
$Monitor1SN = "N/A"
$Monitor2 = "N/A"
$Monitor2SN = "N/A"

# BIOS
try {
  $bios = Get-CimInstance -Class Win32_BIOS -ErrorAction Stop
  $BIOS = "$($bios.Manufacturer), $($bios.SMBIOSBIOSVersion), $($bios.Name)"
} catch {
  Write-Log -Level "WARN" -Message "No se pudo obtener BIOS: $_"
}

# Modelo y número de serie
try {
  $cs = Get-CimInstance -Class Win32_ComputerSystem -ErrorAction Stop
  $Model = $cs.Model
  $SN = (Get-CimInstance -Class Win32_Bios).SerialNumber
} catch {
  Write-Log -Level "WARN" -Message "No se pudo obtener modelo o serie."
}

# CPU
try {
  $CPU = (Get-CimInstance -Class Win32_Processor -ErrorAction Stop).Name
} catch {
  Write-Log -Level "WARN" -Message "No se pudo obtener CPU."
}

# RAM
try {
  $ram = Get-CimInstance -Class Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum
  $RAM = [math]::Round(($ram.Sum / 1GB), 2)
} catch {
  Write-Log -Level "WARN" -Message "No se pudo obtener RAM."
}

# Almacenamiento
try {
  $drive = Get-CimInstance -Class Win32_LogicalDisk -Filter "DeviceID='C:'"
  $Storage = [math]::Round(($drive.Size / 1GB), 2)
} catch {
  Write-Log -Level "WARN" -Message "No se pudo obtener almacenamiento."
}

# GPU
try {
  $gpus = Get-CimInstance -Class Win32_VideoController
  if ($gpus.Count -ge 1) { $GPU0 = $gpus[0].Description }
  if ($gpus.Count -ge 2) { $GPU1 = $gpus[1].Description }
} catch {
  Write-Log -Level "WARN" -Message "No se pudo obtener GPU."
}

# IP / MAC
try {
  $route = Get-NetRoute -DestinationPrefix "0.0.0.0/0" | Sort-Object -Property Metric | Select-Object -First 1
  $iface = Get-NetIPAddress -InterfaceIndex $route.InterfaceIndex -AddressFamily IPv4 | Select-Object -First 1
  $IP = $iface.IPAddress
  $MAC = (Get-NetAdapter -InterfaceIndex $route.InterfaceIndex).MacAddress
} catch {
  Write-Log -Level "WARN" -Message "No se pudo obtener IP/MAC."
}

# Monitores (tolerante)
try {
  $monitors = Get-CimInstance -Namespace "root\WMI" -Class "WMIMonitorID"
  if ($monitors) {
    $Monitor1 = ([System.Text.Encoding]::ASCII.GetString($monitors[0].UserFriendlyName)).Trim([char]0)
    $Monitor1SN = ([System.Text.Encoding]::ASCII.GetString($monitors[0].SerialNumberID)).Trim([char]0)
  } else {
    $Monitor1 = "N/A"
  }
} catch {
  $Monitor1 = "N/A"
  Write-Log -Level "WARN" -Message "No se pudo obtener informacion de monitores."
}

# Sistema operativo
try {
  $os = Get-CimInstance -Class Win32_OperatingSystem
  $OSName = $os.Caption
  $OSBuild = $os.BuildNumber
} catch {
  $OSName = "N/A"; $OSBuild = "N/A"
  Write-Log -Level "WARN" -Message "No se pudo obtener informacion del SO."
}

# ---------------------------
# Crear objeto de inventario
# ---------------------------
$infoObject = [PSCustomObject]@{
  'Date Collected' = $Date
  'Hostname' = $Hostname
  'IP Address' = $IP
  'MAC Address' = $MAC
  'User' = $Username
  'Serial Number' = $SN
  'Model' = $Model
  'BIOS' = $BIOS
  'CPU' = $CPU
  'RAM (GB)' = $RAM
  'Storage (GB)' = $Storage
  'GPU 0' = $GPU0
  'GPU 1' = $GPU1
  'Monitor 1' = $Monitor1
  'Monitor 1 SN' = $Monitor1SN
  'OS' = $OSName
  'OS Build' = $OSBuild
}

$infoColl += $infoObject

# ---------------------------
# Exportar a CSV
# ---------------------------
try {
  $infoColl | Export-Csv -Path $csvFile -NoTypeInformation -Force
  Write-Log -Level "INFO" -Message "Inventario guardado correctamente en $csvFile"
  Write-Host "Inventario guardado correctamente en $csvFile"
} catch {
  Write-Warning "No se pudo guardar el inventario en la ruta configurada. Se usara Documentos."
  $csvFile = Join-Path (Join-Path $env:USERPROFILE "Documents\Practica_PS") "$env:COMPUTERNAME-Inventory.csv"
  $infoColl | Export-Csv -Path $csvFile -NoTypeInformation -Force
  Write-Log -Level "WARN" -Message "Inventario guardado localmente en $csvFile por error de red."
}

Write-Host "Proceso completado."
