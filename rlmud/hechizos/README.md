# Carpeta de hechizos sueltos

Esta carpeta contiene hechizos que, por su naturaleza, pueden pertenecer tanto a la magia arcana como a la magia clerical.

Los archivos XML en esta carpeta no tienen ningún formato especial. Todos ellos son archivos con alias y triggers de MUSHclient que se importan directamente al momento de cargarse las escuelas o esferas que los referencian. Para un pequeño instructivo, véase el archivo [Cómo: Generar un archivo referenciable](../doc/alias.md).

### Nota sobre los hechizos de resistencias y protecciones

Los archivos de resistencias y de protecciones tienen un pequeño añadido que consiste en lo siguiente:

```XML
<!DOCTYPE aliases[
  <!ENTITY grupo "Protección Fuego">
  <!ENTITY corto "pf">
]>

...
```

Esto permite que se puedan modificar fácilmente en caso de algún conflicto con otro alias, sin que se produzcan errores.

Para mayor información sobre el tema, ver [este enlace](https://www.tutorialspoint.com/es/dtd/dtd_entities.htm).
