from flask import Flask, request, jsonify, send_file
from PIL import Image
import io
import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from engines.sts_engine import transcribe_audio

app =Flask(__name__)
                                
@app.route('/upload-image', methods=['POST'])
def upload_image():
    if 'image' not in request.files:
        return jsonify({'error': 'No image file found in the request'}), 400
    image_file = request.files['image']

    try:
        image = Image.open(image_file)
        print(image.size)
        response = ""
        return response, 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500


def answer_question():
    pass
        

'''
    {
        "text" : "",
        "insect" : "" 
    }
'''                                            
@app.route('/ask-bot', methods=['POST'])
def get_tts():
    data = (request.get_json())
    prompt = data.get('text', None)
    insect = data.get('insect', None)
    print("question", prompt)
    response = "llm response"
    print(response)
    return response, 200

@app.route('/ask-bot-audio', methods = ['POST'])
def get_answer_from_audio():
    if 'audio' not in request.files:
        return "No audio file found in the request.", 400
    try:  
        audio_file = request.files['audio']
        input_audio = audio_file.read()

        input_buffer = io.BytesIO(input_audio)
        res = transcribe_audio(input_buffer)
        
        return str(res),200
    except Exception as e:
        print(e)
        return "SERVER ERROR", 500

if(__name__ == "__main__"):
    app.run(debug=True, port = 3000)