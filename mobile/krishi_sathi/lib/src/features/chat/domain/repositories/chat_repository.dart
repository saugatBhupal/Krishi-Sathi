import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:krishi_sathi/src/core/error/failure.dart';
import 'package:krishi_sathi/src/features/chat/domain/entities/message.dart';

abstract class ChatRepository {
  Future<Either<Failure, MessageEntity>> getMessage(File media);
}
