<#
.SYNOPSIS
        Script de ejemplo que crea un menu
 .DESCRIPTION

        Crea un menu


 .PARAMETER  [Nombre de Parametro]

        No hay ningun parametro

.EXAMPLE

        .\Muestra-Menu.ps1

.NOTES

        Autor:   SAMUEL RUIZ
        Fecha:   06/10/2025
        Version:  1.0
#>
# 1 → Mostrar la fecha actual 

# 2 → Mostrar el usuario actual 

# 3 → Salir 
 

    Write-Host "" 

    Write-Host "===== MENU PRINCIPAL =====" 

    Write-Host "1 : Mostrar la fecha actual" 

    Write-Host "2 : Mostrar el usuario actual" 

    Write-Host "3 : Salir" 

    Write-Host "==========================="   

    $opcion = Read-Host "Elige una opcion (1-3)" 


    switch ($opcion){

        "1" { 

            Write-Host "La fecha actual es: $(Get-Date)" } 

        "2" { 

            Write-Host "El usuario actual es: "$env:USERNAME} 

        "3"  {Write-Host "Saliendo del programa...}
            Write-Host "Saliendo del programa...}


        default { 

            Write-Host "Opcion no valida." 

        } 

    } 