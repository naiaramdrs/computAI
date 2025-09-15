from langchain.text_splitter import RecursiveCharacterTextSplitter # Utilizado para separar o texto em chunks
from langchain.schema import Document
from utils.utils import get_model

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
    Você é um agente proposicionador que gera declarações autônomas (proposições) a partir do texto fragmentado (chunk) fornecido.
    Você recebe o seguinte chunk:
    {chunk}

    Utilize a hierarquia aninhada de títulos e subtítulos quando disponível para gerar as proposições.
    Remova as proposições redundantes ou duplicadas.
    """
    
    for chunk in chunks:
        print(f"CHUNK: {chunk}")

        prompt = template.format(chunk=chunk)
        response = model.generate_content(prompt)
        propositions.append(response.text)
        
        print(f"PROPOSITION: {response.text}")

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
