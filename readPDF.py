import os
import pdfplumber
import pandas as pd

def extrair_pdfs_para_planilha(pasta: str, saida: str = "pdfs_coletados.csv"):
    dados = []

    for arquivo in os.listdir(pasta):
        if arquivo.lower().endswith(".pdf"):
            caminho_pdf = os.path.join(pasta, arquivo)

            try:
                with pdfplumber.open(caminho_pdf) as pdf:
                    conteudo = []
                    for pagina in pdf.pages:
                        texto = pagina.extract_text()
                        if texto:
                            conteudo.append(texto.strip())
                    
                    texto_completo = "\n".join(conteudo).strip()

                    # define título como a primeira linha do PDF (se existir)
                    titulo = texto_completo.split("\n")[0] if texto_completo else "Sem título"

                    dados.append({
                        "Arquivo": arquivo,
                        "Título": titulo,
                        "Conteúdo": texto_completo if texto_completo else "Sem conteúdo"
                    })

                    print(f"[OK] Extraído: {arquivo} -> {titulo}")

            except Exception as e:
                print(f"[ERRO] Falha ao processar {arquivo}: {e}")

    df = pd.DataFrame(dados)
    df.to_csv(saida, index=False, encoding="utf-8-sig")
    print(f"Planilha salva em: {saida}")

extrair_pdfs_para_planilha("/pdfs")
