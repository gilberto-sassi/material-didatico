
# Pacotes usados ----------------------------------------------------------

library(readxl)
library(glue)
library(blastula)
library(keyring)
library(tidyverse)


# assunto -----------------------------------------------------------------

txt_subject <- "Reconsideração: R para Ciência de Dados: Aplicações de Regressão Logística"

txt_from <- "cienciadedados.ime@gmail.com"
# senha: ryNPGc2Csy,i
# robô: ugzklqttchzpbbtl
# create_smtp_creds_key(id = "gmail_creds_cdi",
#                       user = txt_from,
#                       provider = "gmail",
#                       use_ssl = TRUE,
#                       overwrite = TRUE)

# txt_from <- "cccmparaiba@gmail.com"
# create_smtp_creds_key(id = "gmail_creds",
#                       user = txt_from,
#                       provider = "gmail",
#                       use_ssl = TRUE,
#                       overwrite = TRUE)


# contatos para enviar email ----------------------------------------------

dados <- read_xlsx("selecao/dados/inscritos_tratado.xlsx", sheet = "convocacao")

txt_to <- dados$email |>
  map_chr(~ str_remove_all(.x, "\\s")) |>
  map_chr(~ str_to_lower(.x))

names <- dados$`nome` |>
    map_chr(\(nome) {
        str_split(nome, "\\s")[[1]][1] |> str_to_title()
    })

# emails de teste
# txt_to <- c("gpsassi@live.com", "ccmparaiba@gmail.com")
# names <- c("Gilberto", "Carolina")


# Composing email ---------------------------------------------------------

for (k in seq_len(length(txt_to))) {
  print(glue("k = {k}"))
   render_email("selecao/texto_convocacao.Rmd",
                render_options = list(params = list(
                    nome = names[k]
                )))|>
    smtp_send(
      to = txt_to[k],
      from = c("Equipe Organizadora" = txt_from),
      subject = txt_subject,
      credentials = creds_key(id = "gmail_creds_cdi")
#      credentials = creds_key(id = "gmail_creds")
    )
}
