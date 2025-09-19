# KlebIA 🤖

A KlebIA é uma assistente virtual desenvolvida para **centralizar o acesso às informações do curso de Ciência da Computação da UFCG**, permitindo que alunos e servidores esclareçam dúvidas sobre disciplinas, horários, regulamentos e demais informações institucionais de forma rápida, simples e eficiente.

A aplicação integra **Modelos de Linguagem de Grande Escala (LLMs)** com **técnicas de pré-processamento** e **Retrieval-Augmented Generation (RAG)**, garantindo a recuperação ágil e precisa de dados provenientes de sites e documentos institucionais.

## 📥 Download do App

Realize o download do APK aqui: [Klebia.apk](https://drive.google.com/file/d/1orPOMH4gIWlQc2c5HoWXdM8D2ORq5b6l/view?usp=drive_link)

## 🎬 Vídeo Demo

Confira a demo do App aqui: [KlebIA - Vídeo demo](https://www.youtube.com/shorts/XDLqn0z2vzA)

<img alt="Screenshot_20250918_225645" src="https://github.com/user-attachments/assets/5fc234ea-3a42-4cc3-96f8-32a456d31109" width="33%" />
<img alt="Screenshot_20250918_225721" src="https://github.com/user-attachments/assets/98b41578-0613-427b-8141-c8b3643d6bf7" width="33%" />
<img alt="Screenshot_20250918_230003" src="https://github.com/user-attachments/assets/51f7bacd-25ad-45c1-aff3-c6f2d085572b" width="33%" />

## 💡 Principais Funcionalidades

- **Chatbot interativo:** Oferece uma interface de conversa simples e intuitiva para tirar dúvidas de alunos e servidores.  
- **Unificação de informações:** Reúne os dados do curso de Ciência da Computação da UFCG em um único canal.
- **Integração com LLMs:** Interpreta perguntas em linguagem natural, oferecendo respostas claras e objetivas para o usuário.
- **Pré-processamento inteligente:** Combina chunking e extração de proposições para organizar e estruturar melhor os dados antes da recuperação.
- **RAG (Retrieval-Augmented Generation):** Recupera informações relevantes na base de dados e gera respostas mais completas e contextualizadas.

## ⚙️ Arquitetura da Solução

<img width="1788" height="780" alt="image" src="https://github.com/user-attachments/assets/cea2462b-80f3-4ba8-a83a-a618ea83e5b1" />

## 🛠️ Tecnologias Utilizadas

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

## 🔬 Execução Local

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

## 👩‍💻 Autoras

- Ana Rita Medeiros de Souza
- Luisa Ledra de Azevedo
- Naiara Medeiros Costa de Almeida
