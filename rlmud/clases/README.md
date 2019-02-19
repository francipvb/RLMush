# Carpeta de clases

En esta carpeta se guardan los archivos para las clases. Estas clases se cargan
cuando llega el comando gmcp *Char.Ficha* especificando la clase.

## Contenido de esta carpeta

Cada subcarpeta corresponde a una clase en general. Por ejemplo, *paladín* o
*druida*. Las especializaciones no tienen su propia carpeta, ya que se guardan
en la carpeta de su clase padre.

Para ver un buen ejemplo de esto, ver la carpeta para el druida. Está la
carpeta de clase para el druida en general, y también archivos para el
*cambiaformas* y *aventurero*, que son sus dos especializaciones.

Esto s particularmente notorio en los hechiceros, que tienen una clase madre
y casi todos los magos son especializaciones con sus particularidades.

Cada subcarpeta contiene un archivo llamado ~config.xml~ que contiene la
configuración de la clase. Los archivos para las especializaciones comparten
exactamente el mismo formato, detallado abajo.

## El archivo de clase

Un archivo ~config.xml~ está compuesto de los siguientes elementos:

* Elementos estándar de XML (opcionales): puede ser `xml` y `DOCTYPE`
* Etiqueta &lt;clase&gt;: Es el elemento raíz de la configuración.
        Contiene los atributos siguientes:
  - `nombre`: El nombre de clase enviado por _GMCP_.
  - `nombre_completo`: Un nombre para mostrar. Todavía no se hace uso de éste.
* Una o más etiquetas &lt;archivo&gt;, estas se colocan dentro de la etiqueta &lt;clase&gt;.
* Una etiqueta &lt;magia&gt;, también dentro de la etiqueta &lt;clase&gt;.
* Una etiqueta &lt;mushclient&gt;. Todo lo que se coloque dentro de esta etiqueta se evaluará como _XML estándar de mushclient_.

### &lt;archivo&gt;

La etiqueta _&lt;archivo&gt;_ define un archivo con datos XML estándar /para
cargar cuando se cargue la clase o especialización. Normalmente contiene
alias, macros y triggers _*temporales*_.

Todo lo que se defina tanto en la etiqueta &lt;mushclient&gt;, así como el
contenido que tengan estos archivos tiene que tener la marca de
`temporary=&quot;y&quot;`, ya que se tienen que poder descartar.

El único atributo que se necesita es `ruta`, que indica la ruta del archivo que
se carga junto con la clase.

El valor tiene que ser un archivo existente relativo al archivo que se carga.
El único límite es que no se pueden indicar archivos de la carpeta padre, solo de carpetas hijas.

Además, si se necesita indicar un archivo en otro lugar, se puede anteponer
el símbolo ~~ ~ ~~ al nombre para indicar una ruta relativa a la raíz (la carpeta rlmud).

Por ejemplo:

    &lt;archivo ruta=&quot;~/clases/caballero.xml&quot; /&gt;

### &lt;magia&gt;

Esta etiqueta contiene elementos &lt;esfera&gt; y &lt;escuela&gt; que se cargan
además de los archivos especificados con las etiquetas &lt;archivo&gt;.

Ambas etiquetas tienen exactamente el mismo formato. La diferenciación es
para cargar según que clases escuelas o esferas.

    &lt;esfera nombre=&quot;curadora&quot; acceso=&quot;menor&quot; /&gt;

* `nombre`: Define el nombre de la escuela o esfera.
* `acceso`: Define el acceso. Puede ser `menor`, `neutral` o `mayor`.
