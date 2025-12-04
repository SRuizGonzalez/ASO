# ASO
---
# Introducción a las Tareas de Controlador de Dominio y Clientes en Windows Server 2025

Windows Server 2025 incorpora mejoras en seguridad, gestión centralizada y virtualización, lo que convierte al entorno de Active Directory en una herramienta esencial para la administración de redes empresariales. Esta introducción resume los conceptos y tareas fundamentales para trabajar con controladores de dominio y equipos cliente dentro de un entorno corporativo.

---

## ¿Qué es un Controlador de Dominio?

Un **Controlador de Dominio (DC)** es un servidor que almacena y gestiona la base de datos de Active Directory. Sus funciones principales incluyen:

- Autenticación de usuarios y equipos.
- Gestión de directivas de grupo (GPO).
- Control centralizado de permisos y recursos.
- Replicación de datos entre controladores.
- Administración de dominios, bosques y unidades organizativas (OU).

Windows Server 2025 introduce mejoras en rendimiento, seguridad Zero Trust y administración híbrida con Azure.

---

## ¿Qué es Active Directory?

Active Directory Domain Services (AD DS) es el servicio que permite:

- Organizar usuarios, grupos y equipos.
- Controlar quién accede a qué recursos.
- Establecer políticas de seguridad.
- Gestionar la estructura de la red mediante OU, dominios y bosques.

---

## Requisitos para un Controlador de Dominio

Antes de instalar un DC en Windows Server 2025 es necesario:

- Nombre del servidor definido.
- Dirección IP estática.
- Función de DNS instalada o lista para instalarse.
- Corrección de fecha/hora (para Kerberos).
- Windows Server 2025 actualizado.

---# ASO