from core.models import get_model
from langchain.schema import Document
from langchain.text_splitter import RecursiveCharacterTextSplitter # Utilizado para separar o texto em chunks

def string_transform(data):
    text = ""
    for _, row in data.iterrows():
        s = "[" + row["Título"] + "] - " + row["Conteúdo"] + " || "
        text += s
    return text

def create_propositions(chunks):
    model = get_model()
    propositions = []

    template = """
    Você é um Agente Proposicionador especializado em extrair informações.
    Sua tarefa é gerar proposições claras, completas e autônomas a partir do chunk de texto fornecido.

    Instruções:
    1. Leia atentamente o seguinte chunk: {chunk}
    2. Construa proposições independentes que possam ser compreendidas sem depender do texto original.
    3. Quando houver títulos e subtítulos hierárquicos, utilize-os para estruturar e organizar as proposições em diferentes níveis de detalhe.
    4. Elimine redundâncias ou duplicações, mantendo apenas proposições únicas e relevantes.
    5. Garanta que cada proposição seja escrita em linguagem declarativa e objetiva.

    Saída esperada:
    Uma lista de proposições organizadas e não redundantes, que representem de forma fiel e condensada o conteúdo do chunk.
    """
    for chunk in chunks:
        prompt = template.format(chunk=chunk)
        response = model.generate_content(prompt)
        propositions.append(response.text)

    return propositions

def create_chunks(text):  
    text_splitter = RecursiveCharacterTextSplitter(
        separators=["\n\n", "\n", " ", ""], ## Aqui teremos onde o nosso texto vai ser separado
        chunk_size = 800, ## Quantidade de caracteres que o nosso chunk vai ter 
        chunk_overlap = 300, ## Quantidade de caracteres que o nosso chunk vai pegar do próximo chunk para que a frase não fique sem sentido
        length_function = len
    )
    
    chunks = text_splitter.split_text(text)
    propositions = create_propositions(chunks)
    documents = []
    ids = []

    for i, proposition in enumerate(propositions):
        doc_id = f"proposition_{i+1}"
        documents.append(
            Document(
                page_content=proposition,
                id=doc_id,
                metadata={"id": doc_id}
            )
        )
        ids.append(doc_id)

    return documents, ids
