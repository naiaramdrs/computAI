import chromadb
import pandas as pd
from langchain.text_splitter import RecursiveCharacterTextSplitter # Utilizado para separar o texto em chunks
from langchain_huggingface import HuggingFaceEmbeddings
import os

os.environ["HUGGINGFACEHUB_API_TOKEN"] = os.getenv("HUGGINGFACE_API_KEY")

data_sites = pd.read_csv('./data/csv/data_site.csv')
data_pdf = pd.read_csv('.data./csv/data_pdf.csv')
  
client = chromadb.PersistentClient(path="./data/chroma_db")

embeddings = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")

collection = client.get_or_create_collection(name="my-collection")

def string_transform(data):
    text = ""
    for _, row in data.iterrows():
        s = "[" + row["Título"] + "] - " + row["Conteúdo"] + " || "
        text += s
    return text 

def create_chunks(text):
    
    text_splitter = RecursiveCharacterTextSplitter(
        separators=["\n\n", "\n", " ", ""], ## Aqui teremos onde o nosso texto vai ser separado
        chunk_size = 1000, ## Quantidade de caracteres que o nosso chunk vai ter 
        chunk_overlap = 300, ## Quantidade de caracteres que o nosso chunk vai pegar do próximo chunk para que a frase não fique sem sentido
        length_function = len
    )
    
    chunks = text_splitter.split_text(text)
    return chunks

def add_vector_database(chunks):
    try: 
        vectors = embeddings.embed_documents(chunks)
        
        collection.add(
            ids=[f"doc_{i}" for i in range(len(chunks))],
            documents=chunks,
            embeddings=vectors
        )
        print("Documentos adicionados com sucesso")
    except Exception as e:
        print("Erro:", e)
