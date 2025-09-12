import google.generativeai as genai
from dotenv import load_dotenv
import os 

load_dotenv()

def get_model():
    genai.configure(api_key=os.getenv("API_KEY_GEMINI"))
    model = genai.GenerativeModel('gemini-1.5-flash')
    return model 

def create_chat(user_question):
    model = get_model()

    prompt = f"Você é uma assistente virtual que atente aos usuários de ciência da computação. Seu objetivo é responder a pergunta do usuário de forma clara e educada. Um usuário fez a seguinte pergunta: {user_question}"
    
    response = model.generate_content(
        prompt,
        generation_config={
            'max_output_tokens': 400
        }
    )
    return response.text