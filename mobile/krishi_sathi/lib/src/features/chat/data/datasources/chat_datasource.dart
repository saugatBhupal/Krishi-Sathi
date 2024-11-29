import 'dart:io';

import 'package:krishi_sathi/src/features/chat/data/models/message_model.dart';

abstract class ChatDatasource {
  Future<MessageModel> getMessage(File media);
  Future<List<int>> getAudio(String text);
}
