# ================================================================================
# pacotes
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import NoSuchElementException
import pandas as pd
from pprint import pprint
import phonenumbers as phone
import time
import urllib
import re


# ================================================================================
# lendo os dados
sheet_id = "1IzrlyxRdiT01-5Ba1oM97dtzw_HRd25VvOvQAU-PVRM"
sheet_name = "lista_presenca"
url = f"https://docs.google.com/spreadsheets/d/{sheet_id}/gviz/tq?tqx=out:csv&sheet={sheet_name}"
contatos = pd.read_csv(url)

# ================================================================================
# configuração

# It has to install geckodriver with cargo: https://github.com/mozilla/geckodriver
# it has to downgrade urllib3 from v2 to v1.26.18
# I'm use selenium==3.141.0 and also got this error.
# After downgrade the urllib3 from v2 to v1.26.18, the error fixed.

navegador = webdriver.Firefox()

navegador.get("https://web.whatsapp.com/")


def checking_element(how, text):
    try:
        navegador.find_element(how, text)
    except NoSuchElementException:
        return False
    return True        

while not checking_element(By.ID, "side"):
    time.sleep(1)

def msg(nome):
    return urllib.parse.quote(f"""
Olá {nome}!\n

📣📣📣Atenção! Segunda-feira, dia 31/01/2025, às 13h é a segunda aula do curso:  *`python` para Ciência de Dados: Exploração e Visualização de Dados*.\n

* Laboratório 143 do IME
* Primeira aula: das 13h às 18h
* Crie uma conta na plataforma Google Drive
* Traga o seu celular para fazer login em sua conta Google Drive

Confirme sua presença respondendo *sim* a esta mensgem❗\n

Até segunda!

""")


# ================================================================================
# mandando msg de texto para geral

pessoa = [re.split("\s", nome.strip())[0].title() for nome in contatos.nome]
telefone = [str(int(tel)) for tel in contatos.telefone]

pessoa = ["Rodrigo", "Carol", "Gilberto"]
telefone = ["71992567626", "71996069870", "71992785352"]

contatos_problemas = {"pessoa": [], "tel": []}


for k in range(len(pessoa)):
    print(f"k = {k} | Pessoa = {pessoa[k]} | Telefone = {telefone[k]}")
    numero = phone.parse(f"+55{telefone[k]}", "BR")
    link = f"https://web.whatsapp.com/send?phone=55{telefone[k]}&text={msg(pessoa[k])}"
    navegador.get(link)
    # checando se a página carregou
    tentando = 1
    if phone.is_valid_number(numero):
        while tentando < 30:
            # espere um pouco
            time.sleep(1)
            # xpath = '//*[@id="main"]/footer/div[1]/div/span[2]/div/div[2]/div[1]/div/div/p'
            # pegar a div que tem o texto digitado
            xpath = '/html/body/div[1]/div/div/div[3]/div/div[4]/div/footer/div[1]/div/span/div/div[2]/div[2]/button'
            #checando se a tem o campo de inputação de texto
            if checking_element(By.XPATH, xpath) and checking_element(By.ID, "side"):
                break
            tentando += 1
    else:
        tentando = 100
    if tentando < 30:
        navegador.find_element(By.XPATH, xpath).send_keys(Keys.ENTER)
        #tempo para enviar a mensagem
        time.sleep(10)
    else:
        contatos_problemas["pessoa"].append(pessoa[k])
        contatos_problemas["tel"].append(telefone[k])
else:
    try:
        df_erro = pd.DataFrame(contatos_problemas)
        print(df_erro)
        df_erro.to_excel("dados/problemas_numeros_zap.xlsx")    
    except:
        print("Todos os telefones estão corretos!")

navegador.quit()
