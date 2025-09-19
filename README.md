# KlebIA

KlebIA é uma assistente virtual projetada para centralizar o acesso às informações do curso de Ciência da Computação da UFCG, de forma que alunos e servidores possam obter informações e esclarecer dúvidas do curso de forma rápida, simples e eficiente. A aplicação combina Modelos de Linguagem de Grande Escala (LLMs) com técnicas de pré-processamento e Retrieval-Augmented Generation (RAG) para garantir a recuperação eficiente de dados extraídos de sites e documentos da Web.

## Funcionalidades

- **Unificação de informações:** Reúne dados do curso de Ciência da Computação da UFCG em um único canal.
- **Integração com LLMs:** Utiliza modelos de linguagem para compreender perguntas em linguagem natural.
- **RAG (Retrieval-Augmented Generation):** Combina recuperação de informações relevantes com geração de respostas precisas.

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

Link para download do aplicativo: [Klebia.apk](https://drive.google.com/file/d/1orPOMH4gIWlQc2c5HoWXdM8D2ORq5b6l/view?usp=drive_link)

<img width="235" height="2400" alt="Screenshot_20250918_225645" src="https://github.com/user-attachments/assets/76f93e4c-301c-4348-b541-f16f078ea3dc" />
<img width="235" height="2400" alt="Screenshot_20250918_225721" src="https://github.com/user-attachments/assets/b65a2de7-4571-49da-9171-c6efddde0dbf" />
<img width="235" height="2400" alt="Screenshot_20250918_230003" src="https://github.com/user-attachments/assets/de981ffe-2f2c-4e7a-81e6-b23010e18daa" />

## Execução Local

### Frontend

1. Siga os passos deste tutorial para instalar o Flutter: [Install Flutter manually](https://docs.flutter.dev/install/manual)
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

## Autoras

- Ana Rita Medeiros de Souza
- Luisa Ledra de Azevedo
- Naiara Medeiros Costa de Almeida
