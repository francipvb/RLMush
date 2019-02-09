{
  nombre = "pantera",
  comandos = {
    mvc = {
      comando = "esconderse",
      ignorar = false,
      regexp = false,
      variables = false,
      },
    c3 = {
      comando = "acechar",
      ignorar = false,
      regexp = false,
      variables = false,
      },
    ["^mv (\\w+)$"] = {
      comando = "sigilar %1",
      variables = false,
      regexp = true,
      ignorar = false,
      },
    c2 = {
      comando = "abalanzarse x , xp",
      ignorar = false,
      regexp = false,
      variables = false,
      },
    },
  }