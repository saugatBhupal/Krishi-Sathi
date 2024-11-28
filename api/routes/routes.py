from flask import Flask, request, jsonify, send_file

app =Flask(__name__)

def upload_image():
    pass

def answer_question():
    pass

@app.route('/ask-bot', methods=['POST'])
def get_tts():
    Text = request.get_json()
    q = Text.get('text', None)
    print(q)
    return("hello")

if(__name__ == "__main__"):
    app.run(debug=True, port = 5000)