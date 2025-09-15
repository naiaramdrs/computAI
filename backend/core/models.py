import os
import google.generativeai as genai
from langchain_huggingface import HuggingFaceEmbeddings

def get_model():
    genai.configure(api_key=os.getenv("API_KEY_GEMINI"))
    model = genai.GenerativeModel('gemini-2.5-flash')
    return model

def get_embeddings_model():
    return HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")
