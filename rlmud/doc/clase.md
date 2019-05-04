# Archivos de clases

En esta carpeta se guardan los archivos para las clases. Estas clases se cargan cuando llega el comando gmcp *Char.Ficha* especificando la clase.

## Contenido de esta carpeta

Cada subcarpeta corresponde a una clase en general. Por ejemplo, *paladín* o *druida*. Las especializaciones no tienen su propia carpeta, ya que se guardan en la carpeta de su clase padre.

Para ver un buen ejemplo de esto, ver la carpeta para el druida. Está la carpeta de clase para el druida en general, y también archivos para el *cambiaformas* y *aventurero*, que son sus dos especializaciones.

Esto es particularmente notorio en los hechiceros, que tienen una clase madre y casi todos los magos son especializaciones con sus particularidades.

Cada subcarpeta contiene un archivo llamado ~config.xml~ que contiene la configuración de la clase. Los archivos para las especializaciones comparten exactamente el mismo formato, detallado abajo.

Por ejemplo, la carpeta clases/druida tiene la siguiente configuración:

* "clases": Carpeta de clases raíz.
  - "config.xml": Archivo de configuración de la clase.
  - "cambiaformas.xml": Archivo para la especialización cambiaformas.
  - "aventurero.xml": Archivo para druidas aventureros.

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

~~~xml
<?xml version="1.0" encoding="iso8859-15"?>
<!DOCTYPE clase>

<clase nombre="druida" nombre_completo="Druida">
	<!-- Archivos para cargar alias y triggers
		 Usar la siguiente forma:
		 <archivo ruta="<ruta>" />
	-->

	<magia>
		<!-- Aquí se definen las escuelas/esferas de la clase -->

		<!-- Esferas menores -->
		<esfera nombre="hechizo" acceso="menor" />
		<esfera nombre="proteccion" acceso="menor" />
		<esfera nombre="combate" acceso="menor" />
		<esfera nombre="adivinacion" acceso="menor" />

		<!-- Esferas con acceso a neutral -->
		<esfera nombre="curadora" acceso="neutral" />
		<esfera nombre="elemental" acceso="neutral" />

		<!-- Esferas con acceso mayor -->
		<esfera nombre="total" acceso="mayor" />
		<esfera nombre="natural" acceso="mayor" />
		<esfera nombre="cambiaformas" acceso="mayor" />
		<esfera nombre="guardiana" acceso="mayor" />
	</magia>
	
	<!-- Dentro de este elemento van los alias y/o triggers copiados de mushclient -->
	<mushclient>
		<aliases>
		  <alias
		   match="c1"
		   enabled="y"
		   sequence="100"
		   temporary="y"
		  >
		  <send>formular retener persona: x</send>
		  </alias>
		  <alias
		   match="c5"
		   enabled="y"
		   sequence="100"
		   temporary="y"
		  >
		  <send>formular fuerza de toro</send>
		  </alias>
		  <alias
		   match="c8"
		   enabled="y"
		   expand_variables="y"
		   sequence="100"
		   temporary="y"
		  >
		  <send>formular canto: @nombre</send>
		  </alias>
		</aliases>
	</mushclient>
</clase>
~~~

### &lt;archivo&gt;

La etiqueta _&lt;archivo&gt;_ define un archivo con datos XML estándar /para cargar cuando se cargue la clase o especialización. Normalmente contiene alias, macros y triggers _*temporales*_.

Todo lo que se defina tanto en la etiqueta &lt;mushclient&gt;, así como el contenido que tengan estos archivos tiene que tener la marca de `temporary=&quot;y&quot;`, ya que se tienen que poder descartar.

El único atributo que se necesita es `ruta`, que indica la ruta del archivo que se carga junto con la clase.

El valor tiene que ser un archivo existente relativo al archivo que se carga. El único límite es que no se pueden indicar archivos de la carpeta padre, solo de carpetas hijas.

Además, si se necesita indicar un archivo en otro lugar, se puede anteponer el símbolo ~~ ~ ~~ al nombre para indicar una ruta relativa a la raíz (la carpeta rlmud).

Por ejemplo:

    &lt;archivo ruta=&quot;~/clases/caballero.xml&quot; /&gt;

Esta etiqueta indica un archivo en la ruta ~rlmud/clases/caballero.xml~, sin importar el archivo en el que se defina.

### &lt;magia&gt;

Esta etiqueta contiene elementos &lt;esfera&gt; y &lt;escuela&gt; que se cargan además de los archivos especificados con las etiquetas &lt;archivo&gt;.

Ambas etiquetas tienen exactamente el mismo formato. La diferenciación es para cargar según que clases escuelas o esferas.

    &lt;esfera nombre=&quot;curadora&quot; acceso=&quot;menor&quot; /&gt;

* `nombre`: Define el nombre de la escuela o esfera.
* `acceso`: Define el acceso. Puede ser `menor`, `neutral` o `mayor`.

## Proceso de carga de una clase

A continuación se detalla el proceso de carga implementado mediante el plugin ~rl_fichas~. Antes de comenzar, cabe aclarar los requerimientos para el correcto funcionamiento del plugin:

* GMCP: El plugin ~gmcp_handler~ debe de estar activo y funcionando.
        Para comprobar esto, se puede teclear `gmcpdebug 1`, lo que activa la
        depuración simple. Cambiar *1* por *0* para desactivaer.
* MUSHclient: El script se escribió para la versión 5.05 del cliente, por lo que con la versión estable 4.94 puede que algunas cosas no funcionen.
* Lector de pantallas: Es recomendable cargar el plugin específico ~rl_mushreader~ para evitar cualquier problema.

### Mensaje GMCP ~Char.Ficha~

Cuando el cliente recibe este mensaje, el plugin busca la clase del personaje en la clave llamada ~clase~. Si esta existe en la carpeta ~clases/&lt;clase&gt;~, se lee el archivo ~clases/&lt;clase&gt;/config.xml~.

tras la lectura, se lee el atributo ~nombre~ de la etiqueta ~&lt;clase&gt;~. En caso de que coinsida con el valor gmcp de la clave ~clase~, se prosede a cargar, en caso contrario, el plugin arrojará un error y lo ignorará.

Lo primero que se carga es el contenido, en forma plana, de la etiqueta ~&lt;mushclient&gt;~. Todos los alias, triggers y cualquier dato dentro de esta se pasan sin procesar directamente a MUSHclient, por lo que si hay algún error al cargar algún alias o trigger, es el primer lugar en el que hay que mirar.

Lo siguiente es la carga de los archivos listados mediante la etiqueta ~&lt;archivo&t;~. Similar a lo que se hace con la etiqueta ~&lt;mushclient&gt;~, estos archivos se leen en orden y su contenido se pasa directamente a mushclient, por lo que pueden ser también fuente de errores. Afortunadamente, el script es tolerante a errores y será capaz de informar si algo así ocurre.

### Carga de escuelas y esferas

Ver el archivo de [escuelas y esferas](magia.md).

### carga de especializaciones

Las especializaciones siguen exactamente el mismo proceso de carga que las clases. Se procesan justo después que la clase se cargó completamente y se busca en la carpeta de la clase, en el archivo "&lt;especializacion&gt;.xml". Las especializaciones pueden cargar sus escuelas y esferas, y si la especialización define una escuela o esfera que ya fue definida en la clase, su nivel de acceso es reemplazado por el de la especialización.

Por ejemplo:

1. La clase Sacerdote de Seldar define curadora a neutral.
1. La especialidad "demonista" define curadora a menor.

Como resultado, la esfera cargada será curadora a menor y nó a neutral.
