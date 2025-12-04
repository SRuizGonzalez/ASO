
<#
.SYNOPSIS
        Script de ejemplo que crea un numero y dice si es PAR o IMPAR

 .DESCRIPTION

        Introduce un numero


 .PARAMETER  [Nombre de Parametro]

        No hay ningun parametro

.EXAMPLE

        .\Num-Par.ps1

.NOTES

        Autor:   SAMUEL RUIZ
        Fecha:   06/10/2025
        Version:  1.0
#>



#Pedir al usuario un numero 

$num = Read-Host "Introduce un numero"

#Comprobar si es par o impar 

if ($num % 2 -eq 0) { 

    Write-Output "El numero $num es PAR." 

} else { 

    Write-Output "El numero $num es IMPAR." 
} 