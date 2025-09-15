from core.models import get_model

def create_chat(user_question, retriever, chat_id):
    template = """
    Você é uma assistente virtual que atende os usuários de Ciência da Computação. 
    Você tem acesso às seguintes informações do curso da UFCG:
    {info_docs}
    
    Um estudante fez a seguinte pergunta:
    {user_question}
    
    Responda de forma clara, concisa e informativa.
    """

    info_docs = retriever.invoke(user_question)
    info_text = "\n\n".join([doc.page_content for doc in info_docs])
    
    model = get_model()
    prompt = template.format(info_docs=info_text, user_question=user_question)
    response = model.generate_content(prompt)
    
    return response.text
