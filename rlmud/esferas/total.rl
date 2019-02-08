{
  nombre = "total",
  comandos_menor = {
    ["^dis(\\d+)$"] = {
      comando = "formular disipar magia: z%1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    lz = {
      comando = "formular luz: armadura",
      variables = false,
      regexp = false,
      ignorar = false,
      },
    ["^ben(\\d+)$"] = {
      comando = "formular bendicion: y%1",
      variables = false,
      regexp = true,
      ignorar = false,
      },
    ["^desp(\\d+)$"] = {
      comando = "formular disipar magia: z%1 espejismo",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    ["^dpp(\\d+)$"] = {
      comando = "formular disipar magia: z%1 piel de piedra",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    ["^ben (\\w+)$"] = {
      comando = "formular bendicion: %1",
      variables = false,
      regexp = true,
      ignorar = false,
      },
    ["^dis (.*?)$"] = {
      comando = "formular disipar magia: %1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    dis = {
      comando = "formular disipar magia: x",
      ignorar = false,
      regexp = false,
      variables = false,
      },
    ["^dpc(\\d+)$"] = {
      comando = "formular disipar magia: z%1 piel de corteza",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    ["^det (\\w+)$"] = {
      comando = "formular detectar magia: %1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    ben = {
      comando = "formular bendicion: @nombre",
      variables = true,
      regexp = false,
      ignorar = false,
      },
    },
  nombre_completo = "total",
  comandos_neutral = {
    },
  comandos_mayor = {
    },
  }