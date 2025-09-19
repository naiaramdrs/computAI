import os
from core.models import get_model
from supabase import create_client, Client

def add_chat_history(chat_id, user_question, chat_answer):
    url = get_url_supabase()
    key = get_key_supabase()
    supabase = get_client_supabase(url, key)

    data = {
        "chat_id": chat_id,
        "user_question": user_question,
        "chat_answer": chat_answer
    }
    response = supabase.table("chat_history").insert(data).execute()
    if response.data is None:
        raise Exception(f"Erro ao inserir no Supabase: {response.data}")
    return response.data

def get_chat_history(chat_id):
    url = get_url_supabase()
    key = get_key_supabase()
    supabase = get_client_supabase(url, key)
    
    response = supabase.table("chat_history").select("user_question, chat_answer").eq("chat_id", chat_id).execute()
    if response.data is None:
        raise Exception(f"Erro ao buscar histórico: {response.data}")
    rows = response.data
    return [(row["user_question"], row["chat_answer"]) for row in rows]

def get_answer(user_question, retriever, chat_id):
    template = """
    Você é uma assistente virtual especializada em atender estudantes e servidores do curso de Ciência da Computação da UFCG. Seu objetivo é fornecer respostas precisas, claras, úteis e educadas sobre qualquer informação relacionada ao curso.
    Você deve se comportar como se soubesse todas as informações naturalmente. Nunca mencione que utiliza documentos, histórico ou contexto para responder. Para o usuário, você deve parecer uma fonte confiável de conhecimento.
    Se não possuir informações suficientes para responder à solicitação, peça desculpas de forma educada e diga que, no momento, não pode ajudar com essa questão específica. Sugira ao estudante consultar o site oficial: https://www.computacao.ufcg.edu.br/. Em seguida, incentive-o a perguntar outra coisa.
    
    obs: No caso de algum usuário perguntar sobre o fluxograma do curso, avise que ele pode consultar o fluxograma nesse site feito por um dos alunos do curso: O fluxograma do curso pode ser consultado neste site feito por um dos estudantes de computação: https://nepe.vercel.app/
    
    Contexto disponível:
    1. Documentação do curso: {info_docs}
    2. Histórico de conversa (quando existir), no formato [(user_question, chat_answer)]: {chat_history}
    3. Pergunta atual do estudante: {user_question}
    
    Instruções de resposta:
    1. Use sempre o histórico da conversa ({chat_history}) para manter coerência, tente sempre interpretar bem o usuário e entender suas necessidades.
    2. Confie sempre nas informações da base de conhecimento ({info_docs}) para responder.
    3. Se não for possível responder, aplique a estratégia de fallback.
    4. Responda de forma clara, concisa e acolhedora, sem jargões desnecessários, mantendo o tom de assistente virtual..
    5. Tente sempre resumir as respostas, para que não fique algo muito verboso, mas que sempre responda o usuário da melhor forma.
  
    Saída esperada:
    Uma resposta única e bem estruturada para o usuário.

    """

    info_docs = retriever.invoke(user_question)
    info_text = "\n\n".join([doc.page_content for doc in info_docs])
    history = get_chat_history(chat_id)
    
    model = get_model()
    prompt = template.format(info_docs=info_text, user_question=user_question, chat_history=history)
    response = model.generate_content(prompt)
    add_chat_history(chat_id, user_question, response.text)
    
    return response.text

def get_url_supabase():
    return os.getenv("SUPABASE_URL")

def get_key_supabase():
    return os.getenv("SUPABASE_KEY")

def get_client_supabase(url, key):
    supabase: Client = create_client(url, key)
    return supabase
