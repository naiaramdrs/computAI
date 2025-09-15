from core.models import get_model
import sqlite3

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
    Você é uma assistente virtual que atende os usuários de Ciência da Computação. 
    Você tem acesso às seguintes informações do curso da UFCG:
    {info_docs}
    
    Um estudante fez a seguinte pergunta:
    {user_question}
    
    Responda de forma clara, concisa e informativa.
    Você está em uma conversa com o usuário, as vezes terá um histórico de conversa que 
    aparecerá aqui, sendo ele dividido em linhas no seguinte formato [(user_question, chat_answer)]: {chat_history}
    """

    info_docs = retriever.invoke(user_question)
    info_text = "\n\n".join([doc.page_content for doc in info_docs])
    
    history = get_chat_history(chat_id)
    
    model = get_model()
    prompt = template.format(info_docs=info_text, user_question=user_question, chat_history=history)
    response = model.generate_content(prompt)
    add_chat_history(chat_id, user_question, response.text)
    
    return response.text
