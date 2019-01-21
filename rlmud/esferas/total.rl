{
  nombre = "total",
  comandos_menor = {
    ["^ben (\\w+)$"] = {
      comando = "formular bendicion: %1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    ben = {
      comando = "formular bendicion: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    ["^ben(\\d+)$"] = {
      comando = "formular bendicion: y%1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    },
  nombre_completo = "total",
  comandos_neutral = {
    },
  comandos_mayor = {
    },
  }