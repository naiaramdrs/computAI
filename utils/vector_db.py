def add_vector_database(chunks, embeddings, collection):
    try: 
        vectors = embeddings.embed_documents(chunks)
        
        collection.add(
            ids=[f"doc_{i}" for i in range(len(chunks))],
            documents=chunks,
            embeddings=vectors
        )
        print("Documentos adicionados com sucesso")
    except Exception as e:
        print("Erro:", e)
