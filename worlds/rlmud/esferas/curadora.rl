{
  nombre = "curadora",
  comandos_menor = {
    ["1"] = {
      comando = "formular curar heridas ligeras: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    ["^3(\\d+)$"] = {
      comando = "formular curar heridas serias: y%1",
      ignorar = true,
      regexp = true,
      variables = false,
      },
    ["3"] = {
      comando = "formular curar heridas serias: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    ["2"] = {
      comando = "formular curar heridas moderadas: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    ["^ce(\\d+)$"] = {
      comando = "formular curar enfermedad: y%1",
      ignorar = true,
      regexp = true,
      variables = false,
      },
    ["^1(\\d+)$"] = {
      comando = "formular curar heridas ligeras: y%1",
      ignorar = true,
      regexp = true,
      variables = false,
      },
    ["^2(\\d+)$"] = {
      comando = "formular curar heridas moderadas: y%1",
      ignorar = true,
      regexp = true,
      variables = false,
      },
    ce = {
      comando = "formular curar enfermedad: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    ["^1(\\d*)$"] = {
      comando = "formular curar heridas ligeras: y%1",
      variables = false,
      regexp = true,
      ignorar = true,
      },
    },
  nombre_completo = "curadora",
  comandos_neutral = {
    ["5"] = {
      comando = "formular curacion: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    ["4"] = {
      comando = "formular curar heridas criticas: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    ["^4(\\d+)$"] = {
      comando = "formular curar heridas criticas: y%1",
      ignorar = true,
      regexp = true,
      variables = false,
      },
    ["^5(\\d+)$"] = {
      comando = "formular curacion: y%1",
      ignorar = true,
      regexp = true,
      variables = false,
      },
    },
  comandos_mayor = {
    },
  }