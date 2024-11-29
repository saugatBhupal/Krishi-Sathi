class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 30000);
  static const Duration receiveTimeout = Duration(seconds: 30000);

  // static const String baseUrl = "http://10.0.2.2:5000/api";
  static const String baseUrl = "https://a581-103-41-173-112.ngrok-free.app/";
  static const String uploadImage = "$baseUrl/upload-image";
  static const String getAudio = "$baseUrl/get-tts";
  static const String askBot = "$baseUrl/ask-bot";
  static const String audioTranscript = "$baseUrl/ask-bot-audio";
}
