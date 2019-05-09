# Cómo: Generar un archivo referenciable

Este pequeño documento describe el procedimiento para generar un archivo XML para ser referenciado por una clase, una escuela o una esfera. También son válidos para ser referenciados desde los personajes, oficios o razas, aunque esto es menos común.

Antes que nada, hay que aclarar que todos los archivos referenciados se ejecutan en el contexto del plugin ~rl_fichas~, por lo que es preferible no hacer uso indiscriminado de las funciones internas ni cambiar datos que use el plugin porque puede tener consecuencias no deseadas. Próximamente se añadirá la manera de ejecutar todo bajo un sandbox.

En resumen, el proceso es el siguiente:

1. En la ventana de MUSHclient, presionar <kbd>CTRL+SHIFT+9</kbd> para abrir el panel de alias.
1. Para agregar un alias, presiona <kbd>ALT+a</kbd>.
1. Rellena la información requerida por el alias, como *Alias* o *Send*.
1. Marca la casilla *Temporary* presionando <kbd>ALT+t</kbd>.
        > Este paso *NO* es opcional.
1. (Recomendado) Rellena el campo *Group* del cuadro de diálogo y pulsa <kbd>enter<kbd> para aceptar los cambios.
1. Si no está marcada la casilla *Tree View*, pulsa <kbd>ALT+w</kbd> para marcarla.
1. Selecciona el grupo o alias que se va a exportar y presiona <kbd>ALT+c</kbd> para copiarlos en el portapapeles.
1. Genera un archivo _XML_ en una carpeta bajo "rlmud/".
        > Si no se guarda en esta localización, no se podrá referenciar el archivo.
1. Ábrelo con tu editor de texto de preferencia y pega el contenido que corresponde al alias generado. Asegúrate de guardar el archivo.
        > Recomiendo [Notepad++](https://notepad-plus-plus.org/).
1. Elimina el grupo o alias generado del mundo abierto para que no genere conflictos al probarlos.

Tras esto, el archivo se podrá utilizar desde escuelas, esferas, clases, personajes, etc...