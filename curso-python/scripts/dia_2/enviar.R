# Pacotes usados ----------------------------------------------------------

if (!require(pacman)){
    install.packages("pacman")
    library(pacman)
}

p_load(
    readxl,
    glue,
    blastula,
    keyring,
    googlesheets4,
    tidyverse
)


# assunto -----------------------------------------------------------------

txt_subject <- "Segunda dia de aula do curso 'python para Ciência de Dados: Exploração e Visualização de Dados'"

# corpo do email ----------------------------------------------------------

# Address of e-mail: scripts/dia_2/corpo_email.Rmd

# configurando as credenciais de email ------------------------------------

txt_from <- "cienciadedados.ime@gmail.com"
# create_smtp_creds_key(id = "cienciadedados.ime@gmail.com",
#                       user = txt_from,
#                       provider = "gmail",
#                       use_ssl = TRUE,
#                       overwrite = TRUE)


# contatos para enviar email ----------------------------------------------

df_raw <- read_sheet(
    "https://docs.google.com/spreadsheets/d/1fcSg1y8cRfPEcW1ybEfNUC_etCbi5v3xsL8voP8ISSc/edit?usp=sharing",
    sheet = "lista_presenca"
)

df_raw <- df_raw |>
    dplyr::distinct(email, .keep_all = TRUE)

txt_to <- df_raw$email |>
  map_chr(~ str_remove_all(.x, "\\s")) |>
  map_chr(~ str_to_lower(.x))

names <- df_raw$nome |>
    map_chr(\(nome) {
        str_split(nome, "\\s")[[1]][1] |> str_to_title()
    })


# # emails de teste
# txt_to <- c("sassi.pereira.gilberto@gmail.com", 'gpsassi@live.com', 'ccmparaiba@gmail.com',
#             'carolina.paraiba@ufba.br')
# names <- c('gilberto 1', 'gilberto 2', 'Carolina','Carol')


# Composing email ---------------------------------------------------------

for (k in seq_along(txt_to)) {
  print(glue("k = {k} | nome = {names[k]} | email = {txt_to[k]}"))
   render_email("scripts/dia_2/corpo_email_erro.Rmd", # tem que mudar aqui
                render_options = list(params = list(
                    nome = names[k]
                ))) |>
    smtp_send(
      to = txt_to[k],
      from = c("R para Ciência de Dados" = txt_from),
      subject = txt_subject,
      credentials = creds_key(id = "cienciadedados.ime@gmail.com")
    )
}
