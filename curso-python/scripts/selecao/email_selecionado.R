
# Pacotes usados ----------------------------------------------------------

library(pacman)
p_load(readxl)
p_load(glue)
p_load(blastula)
p_load(keyring)
p_load(googlesheets4)
p_load(tidyverse)


# assunto -----------------------------------------------------------------

txt_subject <- "Seleção: python para Ciência de Dados: Exploração e Visualização de Dados"

txt_from <- "cienciadedados.ime@gmail.com"
# create_smtp_creds_key(id = "cienciadedados.ime@gmail.com",
#                       user = txt_from,
#                       provider = "gmail",
#                       use_ssl = TRUE,
#                       overwrite = TRUE)

# contatos para enviar email ----------------------------------------------

dados <- read_sheet(
  "https://docs.google.com/spreadsheets/d/1fcSg1y8cRfPEcW1ybEfNUC_etCbi5v3xsL8voP8ISSc/edit?usp=sharing",
  sheet = "titulares"
)

txt_to <- dados$endereco_de_e_mail |>
  map_chr(~ str_remove_all(.x, "\\s")) |>
  map_chr(~ str_to_lower(.x))

names <- dados$nome_completo |>
    map_chr(\(nome) {
        str_split(nome, "\\s")[[1]][1] |> str_to_title()
    })

# # emails de teste
# txt_to <- c("sassi.pereira.gilberto@gmail.com", "ccmparaiba@gmail.com")
# names <- c("Gilberto", "Carolina")

# Composing email ---------------------------------------------------------

for (k in seq_len(length(txt_to))) {
   print(glue("k = {k}"))
   render_email("scripts/selecao/texto_selecionado.Rmd",
                render_options = list(params = list(
                    nome = names[k]
                )))|>
    smtp_send(
      to = txt_to[k],
      from = c("Ciência de Dados - Extensão Universitária" = txt_from),
      subject = txt_subject,
      credentials = creds_key(id = "cienciadedados.ime@gmail.com")
    )
}
