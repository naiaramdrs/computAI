import uuid
from flask import Flask, jsonify, request
from flask_cors import CORS
from core.models import get_embeddings_model
from core.vector_store import get_vector_store, get_retriever
from core.chat import get_answer

app = Flask(__name__)
CORS(app)

embeddings = get_embeddings_model()
vector_store = get_vector_store(embeddings)
retriever = get_retriever(vector_store)

@app.route("/chat", methods=["POST"])
def create_chat():
    chat_id = str(uuid.uuid4())
    data = request.get_json()
    answer = get_answer(data.get('question'), retriever, chat_id)
    return jsonify({"message": "Prompt enviado com sucesso!", "answer": answer, "chat_id": chat_id}), 201

@app.route("/chat/<chat_id>/question", methods=["POST"])
def send_question(chat_id):
    data = request.get_json()
    answer = get_answer(data.get('question'), retriever, chat_id)
    return jsonify({"message": "Prompt enviado com sucesso!", "answer": answer}), 201

if __name__ == "__main__":
    app.run(debug=True)