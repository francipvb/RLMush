# Plugins de reinos de leyenda

Estos archivos contienen scripts que facilitan jugar a reinos de leyenda bajo mushclient.

## Instalación

1. Descargar el repositorio, bien mediante git, o bien mediante [este enlace](https://github.com/francipvb/RLMush/archive/master.zip).
2. Extraer los archivos en la carpeta raíz de MUSHClient.
3. Abrir MUSHClient y generar un nuevo mundo.
4. Pulsar CTRL+SHIFT+p y agregar todos los plugins con el prefijo rl, además del plugin luaaudio.
5. Entrar con una ficha y habilitar el GMCP tecleando `consentir gmcp on`.

Tras esto, ya se puede jugar normalmente, aunque hay un paso específico todavía.

Para evitar que el lector lea cosas muy extrañas es recomendable poner el MXP en yes always desde Game -> Configure -> MXP/Pueblo.

Puede que la última línea no se lea correctamente. Para arreglarlo, ir a Game -> Configure -> Output y marcar la casilla _Convert IAC EOR/GA to new line_.

## Uso del mapa (fase alpha)

De momento, el plugin no es capaz de generar datos de mapa, pero sí de importarlos y leerlos. Para configurar el mapa, se necesita el archivo de mapa de zmud.

Tras descargar y descomprimir el archivo de mapa de ZMud:

1. Teclear `mapa importar` y seleccionar el archivo de mapa (*.mdb) descargado.
2. Esperar hasta que la importación se complete.
3. Caminar normalmente hasta una sala identificable.

Y eso es todo.

Para algunos comandos básicos, teclear mapa ayuda.

### Posibles problemas

Hay un problema con la funcionalidad nativa de listas en mushclient por lo que no es posible utilizar la lista para seleccionar un destino al navegar. El único modo es usar los enlaces que el mapper genera en la ventana de salida, al menos de momento. Cuando pueda ponerme en contacto con el autor de MUSHClient para agregar esta funcionalidad voy a cambiar esta parte del plugin.

Por cualquier inconveniente, reportar generando una issue.