#!/bin/bash
#==============================================================
# Nombre: contararchivos.sh
# Descripción: Cuenta archivos del directorio
# Autor: Samuel Ruiz
# Fecha: 5/11/2025
# Versión: 1.0
# Uso: ./contararchivos.sh
# Comentarios: 
#==============================================================

DIRECTORIO=${1:-.}

if [ ! -d "$DIRECTORIO" ]; then
  echo "Error: '$DIRECTORIO' no es un directorio válido."
  exit 1
fi

NUM_ARCHIVOS=$(find "$DIRECTORIO" -maxdepth 1 -type f | wc -l)

echo "En el directorio '$DIRECTORIO' hay $NUM_ARCHIVOS archivos."