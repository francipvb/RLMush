# Archivos de escuelas y esferas

Los archivos para las escuelas y esferas mágicas se guardan en la carpeta correspondiente del mismo nombre. En la carpeta "escuelas" y "esferas", respectivamente, se guardan los archivos que las definen así como los archivos auxiliares que contienen alias, triggers y otros datos de mushclient.

Además, el elemento XML raíz de un archivo de escuela tiene que ser "&lt;escuela&gt;" para una escuela y "&lt;esfera&gt;" para una esfera.

## Notación

Este es un ejemplo simple para la escuela *abjuración*, se incluye con propósitos de documentación:

```xml
<?xml version="1.0" encoding="iso8859-15"?>
<!DOCTYPE escuela>

<escuela nombre="conjuracion" nombre_completo="Conjuración">
	<archivo ruta="conju_menor.xml" acceso="menor" />

	<mushclient>
		<!-- Alias y triggers en bruto de mushclient -->

	</mushclient>
</escuela>
```

### Elementos XML estándar

Estos elementos son completamente opcionales, pero aveces es recomendable incluirlos para facilitar el mantenimiento de configuraciones complejas.

* `!xml`: Indica propiedades estándar para el documento, como la codificación o la versión del estándar.
* `doctype`: Define el tipo de documento raíz. Adicionalmente, se puede utilizar para definir entidades XML.

### Elemento raíz

El nodo raíz (escuela o esfera), cualquiera que sea, consta de los siguientes atributos:

* `nombre`: El nombre por el que se hace referencia. Se valida también por el nombre de archivo.
* `nombre_completo`: Nombre para mostrar de la escuela o esfera. Se utiliza cuando se carga.

### Elemento &lt;archivo&gt;

Este elemento define un archivo con alias y triggers de mushclient en bruto a cargarse. El archivo que se lea desde este elemento se comporta, esencialmente, como el elemento del mismo nombre para las definiciones de [clases y especializaciones](clase.md). Esta etiqueta consta de los siguientes elementos:

* `ruta`: La ruta al archivo que se va a cargar. Sigue las mismas reglas que su equivalente en el archivo de clase.
* `acceso`: Define el tipo de acceso que condiciona la carga del archivo.

## Proceso de carga

La carga de un archivo de escuela o esfera consta de las siguientes fases:

### Fase de detección

Cuando en un archivo de clase o especialización se encuentra una etiqueta `&lt;magia&gt;`, se prosede con la lectura de los elementos hijos `&lt;escuela&gt;` y `&lt;esfera&gt;`. Cada elemento hace referencia al nombre de una escuela o esfera mediante el atributo `nombre` y condiciona la carga de esta mediante el atributo `acceso`. El acceso puede ser uno de los siguientes:

* `menor`: Acceso mínimo, se acceden a los alias y triggers definidos para toda la escuela o esfera.
* `neutral`: Acceso medio, incluye los alias y triggers definidos para el nivel de acceso menor.
* `mayor`: Define el acceso máximo para la escuela o esfera, generalmente hechizos de mucho poder.

Si el script encuentra un valor que no coinside con ninguno de estos tres valores arrojará un error e ignorará el archivo.

### Lectura de archivos

### Fase de carga