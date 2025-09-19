# KlebIA

KlebIA é uma assistente virtual projetada para centralizar o acesso às informações do curso de Ciência da Computação da UFCG, de forma que alunos e servidores possam obter informações e esclarecer dúvidas de forma rápida, simples e eficiente. A aplicação combina Modelos de Linguagem de Grande Escala (LLMs) com a técnica de Retrieval-Augmented Generation (RAG) para garantir a recuperação eficiente por informações do curso espalhadas na Internet e em documentos.
 
## Funcionalidades

- **Unificação de informações:** Reúne dados do curso de Ciência da Computação da UFCG em um único canal.
- **Integração com LLMs:** Utiliza modelos de linguagem para compreender perguntas em linguagem natural.
- **RAG (Retrieval-Augmented Generation):** Combina recuperação de informações relevantes com geração de respostas precisas.

## Etapas de Desenvolvimento

- **Coleta de dados e Web Scraping:** Extração dos dados de sites da Web, documentos e PDFs com informações relevantes sobre o curso para construir a base de dados.
- **Pré-processamento nos dados:** Nessa etapa, os dados são segmentados em chunks, a partir dos quais são criadas proposições para facilitar a recuperação da informação.
- **Geração de embeddings:** Conversão das proposições em vetores utililizando um modelo de Embedding. Os vetores são armazenados no banco de dados vetorial.
- **Implementação do RAG:** Implementação do retrieval para recuperação da informação no banco de dados vetorial.
- **Integração com LLMs:** Conexão do mecanismo de retrieval com o modelo de linguagem para gerar respostas em linguagem natural baseadas nas informações recuperadas.
- **Desenvolvimento da interface:** Implementação da interface do App em Flutter.
- **Testes e validação:** Testes de usabilidade realizados por diferentes usuários.
- **Deploy e geração do APK:** Empacotamento da aplicação em containers usando Docker e disponibilização para uso real.

## Tecnologias Utilizadas

### Frontend

- **Linguagem:** Dart
- **Framework:** Flutter

### Backend

- **Linguagem:** Python
- **Framework:** Langchain
- **Banco de dados vetorial:** ChromaDB
- **Banco de dados relacional:** Supabase
- **Containerização da aplicação:** Docker 

### Modelos

- **Modelo de Embedding**: gemini-embedding-001
- **Modelo de Linguagem**: gemini-2.5-flash

## Instalação ao App



<img width="235" height="2400" alt="Screenshot_20250918_225645" src="https://github.com/user-attachments/assets/76f93e4c-301c-4348-b541-f16f078ea3dc" />
<img width="235" height="2400" alt="Screenshot_20250918_225721" src="https://github.com/user-attachments/assets/b65a2de7-4571-49da-9171-c6efddde0dbf" />
<img width="235" height="2400" alt="Screenshot_20250918_230003" src="https://github.com/user-attachments/assets/de981ffe-2f2c-4e7a-81e6-b23010e18daa" />

## Execução Local

### Frontend

1. Siga os passos deste tutorial para instalar o Flutter: [Install Flutter manually](https://docs.flutter.dev/install/manual).
2. Instale as extensões `Flutter` e `Dart` do VSCode.

```bash
cd frontend
```

3. Para rodar em ambiente deployado:

```bash
./run.sh
```

4. Para rodar em ambiente de desenvolvimento (necessário subir o backend):

```bash
./run.sh DEV
```

### Backend

1. Instale as dependências necessárias:

```bash
pip install -r backend/requirements.txt
```

2. Rode o projeto:

```bash
python3 backend/app.py
```

## Autores

- Ana Rita Medeiros de Souza
- Luisa Ledra de Azevedo
- Naiara Medeiros Costa de Almeida
