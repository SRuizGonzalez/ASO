# SAMUEL RUIZ
## Acceso SSH

### Usuario autorizado: remoto_ssh
![Imagen2](capturas1/usuario_remoto2.png)

Observamos que ya tenemos el ssh corriendo y funcionado.Y creamos un usuario llamado remoto_ssh.  

### Cliente: PuTTY  
![Imagen2](capturas1/usuario3.png)

Empezamos a instalar el PUTTY 

![Imegen3](capturas1/usuario5.png)

Aqui ya podemos ver que hemos creado la clave que necesitamos para entrar en el usuario.
![Imagen4](capturas1/usuario6.png)

En esta captura vemos como tenemos que hacer un scp para pasar la clave al ubuntu server
 ![Imagen5](capturas1/usuario8.png)

Aqui ya podemos ver desde el ubuntu server como se ha pasado correctamente la clave
### Autenticación: clave pública  
![Imagen6](capturas1/usuario9.png)

En esta captura vemos como nos ha conectado al ubuntu sin necesidad de meter la contraseña solo con la clave
### Contraseña por SSH: deshabilitada
![Imegen7](capturas1/usuario10.png)

Aqui entramos al fichero para deshabilitar el acceso por contraseña
### Usuarios no autorizados: acceso denegado 
![Imagen8](capturas1/usuario11.png)

Ahora al entrar probar con usuarios no autorizados no nos deja entrar con la clave y nos pide la contraseña

## Acceso RDP

### Usuario RDP: remoto_rdp
![Imagen9](capturas1/rdp1.png)

Dentro de Windows Server vamos a habilitar el escritorio remoto 
En Windows Server:
Botón derecho en Este equipo,
Propiedades,
Configuración avanzada del sistema,
Pestaña Acceso remoto.

![Imagen10](capturas1/rdp2.png)

Creamos el usuario y le ponemos una contraseña pero tambien le marcamos que no expire la contraseña

![Imagen11](capturas1/rdp3.png)

Y le añadimos al grupo usuarios de escritorio remoto
### Sistema administrado: Windows Server 2025
![Imagen12](capturas1/rdp.png)

Aqui tenemos que marcar esta opcion de escritorio remoto para que se le puedan unir
### Protocolo: RDP  
![Imagen13](capturas1/rdp5.png)

Aqui vemos como desde el Windows11 añadimos remotamente el usuario remoto_rdp con la contrasña que le pusimos anteriormente
### Grupo de acceso: Usuarios de Escritorio remoto  
![Imagen14](capturas1/rdp6.png)

Ahora comprobamos que funciona y se nos ha conectado correctamente
### Cifrado: Sí  
![Imagen15](capturas1/rdp7.png)

Ahora vemos como desde otro usuario no se ha conectado,se queda pensando y no funciona
