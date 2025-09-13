from langchain_huggingface import HuggingFaceEmbeddings
import chromadb

def get_embeddings_model():
    return HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")
