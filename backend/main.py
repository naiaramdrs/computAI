import pandas as pd
from dotenv import load_dotenv
from core.models import get_embeddings_model
from core.pre_processing import string_transform, create_chunks
from core.vector_store import get_vector_store, get_retriever, add_documents
from core.chat import get_answer

load_dotenv()

data_sites = pd.read_csv('./data/csv/data_sites.csv')
data_pdf = pd.read_csv('./data/csv/data_pdf.csv')

embeddings = get_embeddings_model()
vector_store = get_vector_store(embeddings)
retriever = get_retriever(vector_store)

## Essa parte vamos rodar apenas uma vez, no momento de adicionar os dados no vector database
# text = string_transform(data_sites) + string_transform(data_pdf)
# documents, ids = create_chunks(text)
# add_documents(documents, ids, vector_store)

print(get_answer("Quais as disciplinas do periodo 4?", retriever, 1))
