import chromadb
from langchain_huggingface import HuggingFaceEmbeddings

def get_client():
    return chromadb.PersistentClient(path="./data/chroma_db")

def get_embeddings_model():
    return HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")

def get_collection(client):
    return client.get_or_create_collection(name="my-collection")


