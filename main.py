from utils.utils import get_client, get_collection, get_embeddings_model
from utils.preprocess import string_transform, create_chunks
from utils.vector_db import add_vector_database
from utils.chat import create_chat_conversation
from dotenv import load_dotenv
import pandas as pd

load_dotenv()

data_sites = pd.read_csv('./data/csv/data_site.csv')
data_pdf = pd.read_csv('./data/csv/data_pdf.csv')

client = get_client()
collection = get_collection(client)
embeddings = get_embeddings_model()

## Essa parte vamos rodar apenas uma vez, no momento de adicionar os dados no vector database
# text = string_transform(data_sites) + string_transform(data_pdf)
# chunks = create_chunks(text)
# add_vector_database(chunks, embeddings, collection)

print(create_chat_conversation(collection, "Como é o curso de computacao?"))

