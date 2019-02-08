{
  nombre = "proteccion",
  comandos_menor = {
    pc = {
      ignorar = false,
      variables = false,
      regexp = false,
      comando = "formular piel de corteza",
      },
    ["^pf(\\d+)$"] = {
      comando = "formular proteccion fuego: y%1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    pf = {
      comando = "formular proteccion fuego: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    },
  nombre_completo = "proteccion",
  comandos_neutral = {
    },
  comandos_mayor = {
    },
  }