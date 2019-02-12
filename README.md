# Plugins de reinos de leyenda

Estos archivos contienen scripts que facilitan jugar a reinos de leyenda bajo mushclient.

## Instalación

1. Descargar el repositorio, bien mediante git, o bien mediante [este enlace](https://github.com/francipvb/RLMush/archive/master.zip).
2. Extraer los archivos en la carpeta raíz de MUSHClient.
3. Abrir MUSHClient y generar un nuevo mundo.
4. Pulsar CTRL+SHIFT+p y agregar todos los plugins con el prefijo rl, además del plugin luaaudio y el GMCP_Handler.
5. Entrar con una ficha y habilitar el GMCP tecleando `consentir gmcp on`.

Tras esto, ya se puede jugar normalmente, aunque hay un paso específico todavía.

Para evitar que el lector lea cosas muy extrañas es recomendable poner el MXP en yes always desde Game -> Configure -> MXP/Pueblo.

Puede que la última línea no se lea correctamente. Para arreglarlo, ir a Game -> Configure -> Output y marcar la casilla _Convert IAC EOR/GA to new line_.

## Uso del mapa (experimental)

De momento, el plugin no es capaz de generar datos de mapa, pero sí de importarlos y leerlos. Para configurar el mapa, se necesita el archivo de mapa de zmud.

Tras descargar y descomprimir el archivo de mapa de ZMud:

1. Teclear `mapa importar` y seleccionar el archivo de mapa (*.mdb) descargado.
2. Esperar hasta que la importación se complete.
3. Caminar normalmente hasta una sala identificable.

Y eso es todo.

Para algunos comandos básicos, teclear mapa ayuda.

### Posibles problemas

Hay un problema con la funcionalidad nativa de listas en mushclient por lo que no es posible utilizar la lista para seleccionar un destino al navegar. El único modo es usar los enlaces que el mapper genera en la ventana de salida, al menos de momento. Cuando pueda ponerme en contacto con el autor de MUSHClient para agregar esta funcionalidad voy a cambiar esta parte del plugin.

## Macros predefinidas

Estas macros se agregan mediante scripting desde el plugin _rl_fichas.xml_, por lo que no es posible modificalras sin tocar el archivo del plugin.

* `ALT+(q|w|e|r|a|s|d|f)`: Comandos de clase/ficha principales.
* `ALT+SHIFT+(q|w|e|r|a|s|d|f)`: Comandos de clase o ficha secundarios (ideal para lanzar hechizos defensivos o llamar invocaciones rápidamente). Estas macros no están implementadas.
* `ALT+z`: Envía "estado -i todos" al MUD.
* `ALT+x`: Envía "perder todo" al MUD.
* `ALT+c`: Envía "estado -i x" al MUD.
* Direcciones: Estas macros son para moverse por el mapa del MUD.
  - Norte: `ALT+i`.
  - Sur: `ALT+k` (definido experimentalmente).
  - Oeste: `ALT+j`.
  - Este: `ALT+l`
  - Noroeste: `ALT+u`.
  - Noreste: `ALT+o`.
  - Suroeste: `ALT+m`.
  - Sureste: `ALT+.` (tecla punto).
  - Arriba: `ALT+p`.
  - Abajo: `ALT+ñ`.
  - Ojear: `ALT+,` (Tecla coma).


## Sistemas de clases, especializaciones, oficios, razas y personajes

Me tomé el trabajo de implementar un sistema que intenta simular lo que hacen otros clientes que permiten mucha flexibilidad a la hora de definir alias y triggers.

El formato es XML, pero no es muy complejo. Editarlo es bastante sencillo.

### Personajes

El archivo de personaje es un archivo XML como el siguiente:

```xml

<?xml version="1.0" encoding="iso8859-15"?>
<!DOCTYPE personaje>

<personaje nombre="Dainnil" nombre_completo="Dainnil">
    <!-- Agregue archivos en esta sección
         Para listar un archivo a cargar se usa la forma siguiente:

         <archivo ruta="<rutarelativa>" />
    -->

    <!-- Triggers y alias en bruto de MUSHclient -->
    <mushclient>
        <!-- Pegar dentro de este elemento los alias y triggers de MUSHclient -->

    </mushclient>
</personaje>

```

Los alias y triggers que se agreguen de este modo se ejecutarán en el contexto del plugin ~rl_fichas~, por lo que tendrán acceso a las funciones de sonido y del lector de pantallas.

Con la etiqueta &lt;archivo&gt; se pueden listar archivos que se cargan antes de los alias en la etiqueta &lt;mushclient&gt;. Estos archivos solo pueden contener datos en bruto de MUSHclient, como alias y triggers copiados directamente del diálogo de configuración.

### Clases y especializaciones

A diferencia de los personajes, los archivos de clase (~rlmud/clases/&lt;clase&gt;/config.xml~) son un poco mas complejos.

Además de archivos y de su etiqueta _&lt;mushclient&gt;_, define una etiqueta _&lt;magia&gt;_.
Esta etiqueta contiene etiquetas _&lt;escuela&gt;_ y _&lt;esfera;_ que definen el nombre de la escuela/esfera así como su nivel de acceso.

Estas se cargan después de que se haya cargado todo lo demás (en el contexto de la clase).

### Esferas y escuelas

Las esferas y las escuelas tienen un formato similar al formato del personaje.

Son algo así:

```xml

<?xml version="1.0" encoding="iso8859-15"?>
<!DOCTYPE esfera>

<esfera nombre="curadora" nombre_completo="Curadora">
    
    <archivo ruta="curar_menor.xml" acceso="menor" />

    <!-- Este es el único caso de un hechizo suelto entre esferas -->
    <archivo ruta="curar_ligeras.xml" acceso="menor" />

    <mushclient>
        <!-- Alias y triggers en bruto de mushclient -->

    </mushclient>
</esfera>

```

En este caso, cada archivo tiene definido su nivel de acceso, lo que indicará si se carga o nó el archivo.

El contenido de la etiqueta _&lt;mushclient&gt;_ se carga siempre, por lo que es una buena idea añadir alias y triggers comunes para esa escuela/esfera.

### Generando archivos

Por momento, los únicos archivos que pueden generarse son los de clase, especialización y personaje.

* Personaje: El archivo de personaje se genera la primera vez que el cliente se conecta.
* Clase: Para generar un archivo de clase, ejecutar el comando `$cinit`.
* Especialización: Para generar un archivo de especialización, ejecutar el comando `$sinit`.
        Se puede escribir directamente `$sinit` si la clase en cuestión incluye una especialización, para generar ambos archivos rápidamente.

Estos comandos deben introducirse en la ventana de comandos de MUSHclient.

## Contacto

Por cualquier consulta respecto a la config, se me puede encontrar en el MUD como Dainnil, o bien se me puede enviar un correo a [francipvb@hotmail.com](mailto:francipvb@hotmail.com).

Otras maneras de reportar problemas o solicitar cambios son a través de github, reportando una issue o a través del foro de Reinos de Leyenda.
