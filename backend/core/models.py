import os
import google.generativeai as genai
from core.embeddings import GeminiEmbeddings


def get_model():
    genai.configure(api_key=os.getenv("API_KEY_GEMINI"))
    model = genai.GenerativeModel('gemini-2.5-flash')
    return model

def get_embeddings_model():
    return GeminiEmbeddings()

