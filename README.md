# KlebIA

KlebIA é uma assistente virtual criada para suprir a ausência de um canal unificado de acesso às informações do curso de Ciência da Computação da UFCG. Alunos e servidores, que atualmente precisam recorrer a diversas fontes para esclarecer dúvidas, podem agora obter respostas rápidas e precisas. A KlebIA utiliza modelos de linguagem avançados (LLMs) integrados à técnica de Retrieval-Augmented Generation (RAG), centralizando as informações e tornando o processo mais prático e eficiente.
 
## Funcionalidades 
- **Unificação de informações:** Reúne dados do curso de Ciência da Computação da UFCG em um único canal.
- **Integração com LLMs:** Utiliza modelos de linguagem para compreender perguntas em linguagem natural.
- **RAG (Retrieval-Augmented Generation):** Combina recuperação de informações relevantes com geração de respostas precisas.

## Etapas de desenvolvimento
- **Coleta de dados e Web Scraping:** Extração dos dados de sites da Web, documentos e PDFs com informações relevantes sobre o curso para construir a base de dados.
- **Pré-processamento nos dados:** Nessa etapa, os dados são segmentados em chunks, a partir dos quais são criadas, por um agente, proposições para facilitar a recuperação da informação.
- **Geração de embeddings:** Conversão das proposições em vetores utililizando um modelo de Embedding. Os vetores são armazenados no banco de dados vetorial.
- **Implementação do RAG:** Implementação do retrieval para recuperação da informação no banco de dados vetorial.
- **Integração com LLMs:** Conexão do mecanismo de retrieval com o modelo de linguagem para gerar respostas em linguagem natural baseadas nas informações recuperadas.
- **Desenvolvimento da interface:** Implementação da interface em Flutter.
- **Testes e validação:** Testes de funcionalidades.
- **Deploy e geração do APK:** Empacotamento da aplicação em containers usando Docker e disponibilização para uso real.

## Tecnologias

### Front-end
- **Linguagem:** Dart
- **Framework:** Flutter

### Back-end
- **Linguagem:** Python
- **Banco de dados vetorial:** ChromaDB
- **Banco de dados relacional:** Supabase
- **Containerização da aplicação:** Docker 

## Modelos utilizados 

- **Modelo de Embeddings**: gemini-embedding-001
- **Modelo de Linguagem**: gemini-2.5-flash

## Instalação

```bash
pip install -r backend/requirements.txt
```

## Execução Local

### Frontend

```bash
cd frontend
```

```bash
flutter run
```

### Backend

```bash
cd backend
```

```bash
python3 app.py
```

## Exemplos
<img width="235" height="2400" alt="Screenshot_20250918_225645" src="https://github.com/user-attachments/assets/76f93e4c-301c-4348-b541-f16f078ea3dc" />
<img width="235" height="2400" alt="Screenshot_20250918_225721" src="https://github.com/user-attachments/assets/b65a2de7-4571-49da-9171-c6efddde0dbf" />
<img width="235" height="2400" alt="Screenshot_20250918_230003" src="https://github.com/user-attachments/assets/de981ffe-2f2c-4e7a-81e6-b23010e18daa" />
<img width="235" height="2400" alt="Screenshot_20250918_230019" src="https://github.com/user-attachments/assets/afc85811-45ac-40b8-be9f-c4f36ef99450" />



## Autores
- Ana Rita Medeiros
- Luisa Ledra
- Naiara Almeida
