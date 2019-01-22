{
  nombre = "total",
  comandos_menor = {
    ["^dis(\\d+)$"] = {
      comando = "formular disipar magia: z%1",
      variables = false,
      regexp = true,
      ignorar = false,
      },
    lz = {
      comando = "formular luz: armadura",
      ignorar = false,
      regexp = false,
      variables = false,
      },
    ["^ben(\\d+)$"] = {
      comando = "formular bendicion: y%1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    ["^desp(\\d+)$"] = {
      comando = "formular disipar magia: z%1 espejismo",
      variables = false,
      regexp = true,
      ignorar = false,
      },
    ["^dpp(\\d+)$"] = {
      comando = "formular disipar magia: z%1 piel de piedra",
      variables = false,
      regexp = true,
      ignorar = false,
      },
    ["^ben (\\w+)$"] = {
      comando = "formular bendicion: %1",
      ignorar = false,
      regexp = true,
      variables = false,
      },
    ["^dis (.*?)$"] = {
      comando = "formular disipar magia: %1",
      variables = false,
      regexp = true,
      ignorar = false,
      },
    dis = {
      comando = "formular disipar magia: x",
      variables = false,
      regexp = false,
      ignorar = false,
      },
    ["^dpc(\\d+)$"] = {
      comando = "formular disipar magia: z%1 piel de corteza",
      variables = false,
      regexp = true,
      ignorar = false,
      },
    ben = {
      comando = "formular bendicion: @nombre",
      ignorar = false,
      regexp = false,
      variables = true,
      },
    },
  nombre_completo = "total",
  comandos_neutral = {
    },
  comandos_mayor = {
    },
  }