from flask import Flask, jsonify, render_template
import requests
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()
token = os.getenv('PERPLEXITYAI_API_KEY')

app = Flask(__name__)

# List of banks
BANKS = [
    "Kapital_Bank",
    "ABB_Bank",
    "Unibank",
    "AccessBank",
    "Yelo_Bank"
]

@app.route('/')
def index():
    return render_template('index.html', banks=BANKS)

@app.route('/loan_terms/<bank_name>')
def loan_terms(bank_name):
    url = "https://api.perplexity.ai/chat/completions"
    
    payload = {
        "model": "llama-3.1-sonar-small-128k-online",
        "messages": [
            {"role": "system", "content": "Be precise and concise."},
            {"role": "user", "content": f"What are the loan terms for {bank_name}?"}
        ],
        "max_tokens": 150,
        "temperature": 0.2,
        "return_citations": True,
    }

    headers = {
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json"
    }

    response = requests.post(url, json=payload, headers=headers)

    if response.status_code == 200:
        data = response.json()
        # Extracting the content
        loan_terms_content = data['choices'][0]['message']['content']
        return jsonify({"bank_name": bank_name, "loan_terms": loan_terms_content})
    else:
        return jsonify({"error": response.text}), response.status_code

if __name__ == '__main__':
    app.run(debug=True)