from langchain_huggingface import HuggingFaceEmbeddings
import google.generativeai as genai
import os

def get_model():
    genai.configure(api_key=os.getenv("API_KEY_GEMINI"))
    model = genai.GenerativeModel('gemini-1.5-flash')
    return model

def get_embeddings_model():
    return HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")
