from utils.utils import get_client, get_collection, get_embeddings_model
from utils.preprocess import string_transform, create_chunks
from utils.vector_db import add_vector_database
from dotenv import load_dotenv
import pandas as pd
import os

load_dotenv()
os.environ["HUGGINGFACEHUB_API_TOKEN"] = os.getenv("HUGGINGFACE_API_KEY")

data_sites = pd.read_csv('./data/csv/data_site.csv')
data_pdf = pd.read_csv('./data/csv/data_pdf.csv')

client = get_client()
collection = get_collection(client)
embeddings = get_embeddings_model()

## Essa parte vamos rodar apenas uma vez, no momento de adicionar os dados no vector database
# text = string_transform(data_sites) + string_transform(data_pdf)
# chunks = create_chunks(text)
# add_vector_database(chunks, embeddings, collection)



