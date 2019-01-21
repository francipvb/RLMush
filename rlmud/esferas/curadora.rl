{
  nombre = "curadora",
  comandos_menor = {
    cl = {
      comando = "formular curar heridas ligeras: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    cm = {
      comando = "formular curar heridas moderadas: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    ["^nv(\\d+)$"] = {
      comando = "formular neutralizar veneno: y1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    ["^cl(\\d+)$"] = {
      comando = "formular curar heridas ligeras: y%1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    ["^ce(\\d+)$"] = {
      comando = "formular curar enfermedad: y%1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    ce = {
      comando = "formular curar enfermedad: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    ["^ci(\\d+)$"] = {
      comando = "formular cicatrizar: y%1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    ci = {
      comando = "formular cicatrizar: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    ["^exm(\\d+)$"] = {
      comando = "formular extirpar maldicion: y%1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    exm = {
      comando = "formular extirpar maldicion: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    ["^cm(\\d+)$"] = {
      comando = "formular curar heridas moderadas: y%1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    ["^cs(\\d+)$"] = {
      comando = "formular curar heridas serias: y%1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    cs = {
      comando = "formular curar heridas serias: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    nv = {
      comando = "formular neutralizar veneno: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    },
  nombre_completo = "curadora",
  comandos_neutral = {
    },
  comandos_mayor = {
    },
  }