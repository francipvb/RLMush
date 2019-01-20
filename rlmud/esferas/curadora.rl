{
  nombre = "curadora",
  comandos_menor = {
    ["^ce(\\d+)$"] = {
      comando = "formular curar enfermedad: y%1",
      variables = false,
      regexp = true,
      ignorar = true,
      },
    ce = {
      comando = "formular curar enfermedad: @nombre",
      variables = true,
      regexp = false,
      ignorar = false,
      },
    },
  nombre_completo = "curadora",
  comandos_neutral = {
    },
  comandos_mayor = {
    },
  }