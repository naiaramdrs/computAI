from langchain.text_splitter import RecursiveCharacterTextSplitter # Utilizado para separar o texto em chunks
from langchain.schema import Document

def string_transform(data):
    text = ""
    for _, row in data.iterrows():
        s = "[" + row["Título"] + "] - " + row["Conteúdo"] + " || "
        text += s
    return text

def create_chunks(text):  
    text_splitter = RecursiveCharacterTextSplitter(
        separators=["\n\n", "\n", " ", ""], ## Aqui teremos onde o nosso texto vai ser separado
        chunk_size = 800, ## Quantidade de caracteres que o nosso chunk vai ter 
        chunk_overlap = 300, ## Quantidade de caracteres que o nosso chunk vai pegar do próximo chunk para que a frase não fique sem sentido
        length_function = len
    )
    
    chunks = text_splitter.split_text(text)
    documents = []
    ids = []

    for i, chunk in enumerate(chunks):
        doc_id = f"chunk_{i+1}"
        documents.append(
            Document(
                page_content=chunk,
                id=doc_id,
                metadata={"id": doc_id}
            )
        )
        ids.append(doc_id)

    return documents, ids
