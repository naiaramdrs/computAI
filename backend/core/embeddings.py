import os
import google.generativeai as genai
from langchain_core.embeddings import Embeddings

class GeminiEmbeddings(Embeddings):
    def __init__(self):
        genai.configure(api_key=os.getenv("API_KEY_GEMINI"))
        self.model = "models/embedding-001"

    def embed_documents(self, texts: list[str]) -> list[list[float]]:
        embeddings = []
        for text in texts:
            response = genai.embed_content(
                model=self.model,
                content=text,
                task_type="retrieval_document",
            )
            embeddings.append(response["embedding"])
        return embeddings

    def embed_query(self, text: str) -> list[float]:
        response = genai.embed_content(
            model=self.model,
            content=text,
            task_type="retrieval_query",
        )
        return response["embedding"]
