# 📁 ASO – Unidad Trabajo 2 (UT2)  
**Autor**: Samuel Ruiz González  
**Asignatura**: Administración de Sistemas Operativos (ASO)

Este repositorio contiene la documentación de las actividades prácticas de la **UT2**, centradas en la administración de un entorno **Active Directory** con dos controladores de dominio (`WS_GUI_SRG_DC1` y `WS_GUI_SRG_DC2`) bajo el dominio `srg.local`.

---

## 📄 Archivos y contenidos

###  `ASO_UT2_Actividad1_dominio_samuel_ruiz.pdf`  
**Objetivo**: Creación del dominio inicial y configuración básica de Active Directory.

- Instalación del rol **Servicios de dominio de Active Directory (AD DS)** en `WS_GUI_SRG_DC1`.
- Creación del dominio **`srg.local`**.
- Verificación del entorno de dominio funcional.

---

###  `ASO_UT2_Actividad2_WAN_pfSense_samuel_ruiz.pdf`  
**Objetivo esperado**: Configuración de red WAN con pfSense para conectar los servidores.

- **Contenido real**: **Idéntico al de la Actividad 4** (creación de UO `ASIR2`, usuarios, delegación, carpeta compartida...).

---

###  `ASO_UT2_Actividad3_SamuelRuiz.pdf`  
**Objetivo**: Promoción de `WS_GUI_SRG_DC2` como segundo controlador de dominio.

- Configuración de IP estática en `DC2`.
- Instalación del rol **AD DS** en `WS_GUI_SRG_DC2`.
- Promoción como **controlador de dominio adicional** en el dominio existente (`srg.local`).
- Replicación desde `WS_GUI_SRG_DC1`.
- Verificación de replicación y funcionalidad del **servicio DNS** en ambos DCs.

---

###  `ASO_UT2_Actividad4_Creacionobjetos_samuel_ruiz.pdf`  
**Objetivo**: Gestión de identidades y recursos en Active Directory.

#### Acciones realizadas:
1. **Creación de la Unidad Organizativa (UO)**: `ASIR2`.
2. **Usuarios creados en la UO**:
   - `ASIR201` a `ASIR205` (con contraseña temporal y obligación de cambio).
   - `ASIR2PR` (usuario administrador delegado).
3. **Delegación de control** sobre `ASIR2` para `ASIR2PR`:
   - Crear/eliminar/administrar cuentas de usuario.
   - Restablecer contraseñas.
   - Leer/escribir información de usuario.
4. **Grupo de seguridad**: `AlumnosASIR2`, incluyendo a todos los usuarios anteriores.
5. **Carpeta compartida** en `D:\ASIR2_COMPARTIDA`:
   - Nombre compartido: `ASIR2COMPARTIDA`.
   - Permisos de **recurso compartido** y **NTFS**: control total para el grupo `AlumnosASIR2`.
6. **Pruebas de acceso**:
   - Acceso exitoso desde cliente Windows 11 con usuario `ASIR201`.
   - Intento de inicio de sesión en `DC2` con `ASIR2PR` **bloqueado** por política de grupo (comportamiento esperado por seguridad).

---

## 🔍 Observaciones generales

- El dominio `srg.local` está correctamente configurado con **alta disponibilidad** (2 DCs + DNS replicado).
- Se aplican buenas prácticas: uso de UOs, grupos de seguridad, delegación granular y separación de permisos.
- El entorno está preparado para pruebas de replicación, autenticación y acceso a recursos.

---
