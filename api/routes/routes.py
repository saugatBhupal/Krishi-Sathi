from flask import Flask, request, jsonify, send_file
from PIL import Image
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

if(__name__ == "__main__"):
    app.run(debug=True, port = 5000)