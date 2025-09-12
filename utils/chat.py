import google.generativeai as genai
from langchain_core.prompts import ChatPromptTemplate
from dotenv import load_dotenv
import os 

load_dotenv()

def get_model():
    genai.configure(api_key=os.getenv("API_KEY_GEMINI"))
    model = genai.GenerativeModel('gemini-1.5-flash')
    return model 

def create_chat(user_question, retriever):
    template = """
    Você é uma assistente virtual que atende aos usuários de Ciência da Computação. 
    Você tem acesso às seguintes informações do curso da UFCG:
    {info_docs}
    
    Um estudante fez a seguinte pergunta:
    {user_question}
    
    Responda de forma clara, concisa e informativa.
    """

    info_docs = retriever.invoke(user_question)
    info_text = "\n\n".join([doc.page_content for doc in info_docs])
    
    model = get_model()
    
    prompt_text = template.format(info_docs=info_text, user_question=user_question)
    
    response = model.generate_content(prompt_text)
    
    return response.text  

