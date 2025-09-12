from utils.utils import get_client, get_collection, get_embeddings_model
from utils.preprocess import string_transform, create_chunks
from utils.vector_db import add_vector_database
from utils.chat import create_chat
from utils.vector_db import get_vector_store, get_retriever
from dotenv import load_dotenv
import pandas as pd
import os

load_dotenv()

data_sites = pd.read_csv('./data/csv/data_site.csv')
data_pdf = pd.read_csv('./data/csv/data_pdf.csv')

client = get_client()
collection = get_collection(client)
embeddings = get_embeddings_model()
vector_store = get_vector_store(embeddings)

## Essa parte vamos rodar apenas uma vez, no momento de adicionar os dados no vector database
# if not os.path.exists("./data/chroma_db"):
#     text = string_transform(data_sites) + string_transform(data_pdf)
#     documents, ids = create_chunks(text)
#     add_vector_database(documents, ids, vector_store)

print(create_chat("Como é o curso de computacao?"))

