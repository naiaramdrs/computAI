from langchain_chroma import Chroma

def get_vector_store(embeddings):
    vector_store = Chroma(
        collection_name="klebia",
        embedding_function=embeddings,
        persist_directory="./data/chroma_db"
    )
    return vector_store

def get_retriever(vector_store):
    retriever = vector_store.as_retriever(
        search_type="similarity",
        search_kwargs={"k": 5}
    )
    return retriever

def add_vector_database(documents, ids, vector_store):
    try:         
        vector_store.add_documents(
            ids=ids,
            documents=documents,
        )
        print("Documentos adicionados com sucesso")
    except Exception as e:
        print("Erro:", e)
