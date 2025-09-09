import cloudscraper
from bs4 import BeautifulSoup
import pandas as pd
import time

links_sites = {
    "computacao_ufcg_ofc": {
        "base_url": "https://www.computacao.ufcg.edu.br/?",
        "pages": [
            "page_id=572",
            "page_id=711",
            "page_id=805",
            "page_id=813",
            "page_id=724",
            "page_id=650",
            "page_id=1112",
            "page_id=1117",
            "page_id=1278",
            "page_id=1127",
            "page_id=1381",
            "page_id=2438",
            "page_id=2184",
            "page_id=1291",
            "page_id=1158",
            "page_id=749",
            "page_id=2245",
            "page_id=1273",
            "page_id=1173",
            "page_id=2269",
            "page_id=2533",
            "page_id=1163"
        ]
    },
    "memoria_computacao": {
        "base_url": "https://memoria.computacao.ufcg.edu.br/",
        "pages": [
            "p%C3%A1gina-principal",
            "graduacao/estagios",
            "graduacao/monitoria/perguntas-e-respostas",
            "graduacao/pet-computa%C3%A7%C3%A3o",
            "projeto-ol%C3%ADmpico"
        ]
    },
    "portal_ufcg": {
        "base_url": "https://portal.ufcg.edu.br/",
        "pages": [
            "graduacao/cursos-graduacao/145-ciencia-da-computacao-ceei-d.html"
        ]
    },
}

def coletar_dados_computacao_ufcg_ofc(link: str):
    if link not in links_sites:
        raise ValueError(f"Projeto '{link}' não encontrado.")

    base_url = links_sites[link]["base_url"]
    pages = links_sites[link]["pages"]
    dados = []
    scraper = cloudscraper.create_scraper()

    for page in pages:
        full_url = base_url + page
        response = scraper.get(full_url)
        if response.status_code != 200:
            print(f"Erro ao acessar {full_url} (Status {response.status_code})")
            continue

        soup = BeautifulSoup(response.text, "html.parser")

        titulos = soup.find_all("h2", class_="elementor-heading-title")

        for titulo_tag in titulos:
            titulo = titulo_tag.get_text(strip=True)

            conteudos = []
            for sibling in titulo_tag.find_all_next():
                if sibling.name == "h2" and "elementor-heading-title" in sibling.get("class", []):
                    break
                if sibling.name == "div" and "elementor-widget-container" in sibling.get("class", []):
                    conteudos.append(sibling.get_text(strip=True, separator=" "))

            texto = " ".join(conteudos) if conteudos else "Sem conteúdo"

            dados.append({
                "Página": full_url,
                "Título": titulo,
                "Conteúdo": texto
            })

            print(f"[{page}] Coletado título: {titulo}")

        time.sleep(1)

    df = pd.DataFrame(dados)
    nome_arquivo = f"paginas_{link}.csv"
    df.to_csv(nome_arquivo, index=False, encoding="utf-8-sig")
    print(f"[{link}] Dados salvos em: {nome_arquivo}")
    
def coletar_dados_computacao_memoria(link: str):
    if link not in links_sites:
        raise ValueError(f"Projeto '{link}' não encontrado.")

    base_url = links_sites[link]["base_url"]
    pages = links_sites[link]["pages"]
    dados = []
    scraper = cloudscraper.create_scraper()

    for page in pages:
        full_url = base_url + page
        response = scraper.get(full_url)
        if response.status_code != 200:
            print(f"Erro ao acessar {full_url} (Status {response.status_code})")
            continue

        soup = BeautifulSoup(response.text, "html.parser")

        # pegar título principal
        titulo_tag = soup.find("span", class_="C9DxTc")
        titulo = titulo_tag.get_text(strip=True) if titulo_tag else "Sem título"

        # pegar conteúdo
        conteudo_div = soup.find("div", class_="tyJCtd mGzaTb Depvyb baZpAe")
        conteudo = conteudo_div.get_text(" ", strip=True) if conteudo_div else "Sem conteúdo"

        dados.append({
            "Página": full_url,
            "Título": titulo,
            "Conteúdo": conteudo
        })

        print(f"[{page}] Coletado título: {titulo}")

        time.sleep(1) 

    df = pd.DataFrame(dados)
    nome_arquivo = f"paginas_men_{link}.csv"
    df.to_csv(nome_arquivo, index=False, encoding="utf-8-sig")
    print(f"[{link}] Dados salvos em: {nome_arquivo}")

link = "memoria_computacao"
# coletar_dados_computacao_ufcg_ofc(link)
coletar_dados_computacao_memoria(link)