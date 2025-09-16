import sqlite3
from core.models import get_model

def add_chat_history(chat_id, user_question, chat_answer):
    conn = sqlite3.connect("./data/sqlite.db")
    cursor = conn.cursor()
    
    cursor.execute("""
        INSERT INTO chat_history (chat_id, user_question, chat_answer)
        VALUES (?, ?, ?)
    """, (chat_id, user_question, chat_answer))
    
    conn.commit()
    conn.close()
    
def get_chat_history(chat_id):
    conn = sqlite3.connect("./data/sqlite.db")
    cursor = conn.cursor()
    
    cursor.execute("SELECT user_question, chat_answer FROM chat_history WHERE chat_id=?", (chat_id,))
    rows = cursor.fetchall()
    
    conn.close()
    return rows

def get_answer(user_question, retriever, chat_id):
    template = """
    Você é uma assistente virtual especializada em atender estudantes do curso de Ciência da Computação da UFCG.
    Seu objetivo é fornecer respostas precisas, claras e úteis com base nas informações disponíveis.

    Contexto disponível:
    1. Documentação do curso: {info_docs}
    2. Histórico de conversa (quando existir), no formato [(user_question, chat_answer)]: {chat_history}
    3. Pergunta atual do estudante: {user_question}

    Instruções:
    1. Analise a pergunta do estudante levando em conta o histórico da conversa (se houver).
    2. Utilize as informações do curso da UFCG fornecidas na documentação como fonte prioritária.

    Responda de forma:
    1. Clara e concisa, evitando jargões desnecessários.
    2. Informativa e confiável, garantindo precisão.
    3. Conversacional e acolhedora, mantendo o tom de assistente virtual.
    4. Se não encontrar a resposta diretamente na documentação fornecida, use seu conhecimento geral para ajudar, mas sinalize essa limitação.

    Saída esperada:
    Uma resposta única e bem estruturada para o estudante.
    """

    info_docs = retriever.invoke(user_question)
    print("retriever", info_docs)
    info_text = "\n\n".join([doc.page_content for doc in info_docs])
    history = get_chat_history(chat_id)
    
    model = get_model()
    prompt = template.format(info_docs=info_text, user_question=user_question, chat_history=history)
    response = model.generate_content(prompt)
    add_chat_history(chat_id, user_question, response.text)
    
    return response.text
