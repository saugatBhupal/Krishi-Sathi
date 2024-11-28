from google.cloud import speech_v1p1beta1 as speech
import io
import os
import ffmpeg

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "/Users/saugatsingh/Documents/keys/starlit-hulling-350715-8f391a81e359.json"

def convert_audio(input_file):
    try:
        ffmpeg.input(input_file).output(
            "output.wav",
            format="wav",     
            acodec="pcm_s16le", 
            ac=1,            
            ar="16000"       
        ).run(overwrite_output=True)
        print(f"Conversion successful! File saved to: {input_file}")
    except Exception as e:
        print(f"Error during conversion : e")


def transcribe_audio(audio_file_path):
    print(audio_file_path)
    client = speech.SpeechClient()
    convert_audio(audio_file_path)
    with io.open('output.wav', "rb") as audio_file:
        content = audio_file.read()

    audio = speech.RecognitionAudio(content=content)
    config = speech.RecognitionConfig(
        encoding=speech.RecognitionConfig.AudioEncoding.LINEAR16,
        sample_rate_hertz=16000,  
        language_code="ne-NP"     
    )

    response = client.recognize(config=config, audio=audio)

    for result in response.results:
        print("Transcript: {}".format(result.alternatives[0].transcript))
    
        
def test_google_authentication():
    try:
        client = speech.SpeechClient()
        print("Google Cloud Speech-to-Text API authentication successful!")
    except Exception as e:
        print("Authentication failed:", e)

transcribe_audio('/Users/saugatsingh/Documents/Projects/Krishi Sathi/test-01.aifc')