import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:krishi_sathi/src/core/domain/mappers/message_mappers.dart';
import 'package:krishi_sathi/src/core/error/failure.dart';
import 'package:krishi_sathi/src/features/chat/data/datasources/chat_datasource.dart';
import 'package:krishi_sathi/src/features/chat/data/models/message_model.dart';
import 'package:krishi_sathi/src/features/chat/domain/entities/message.dart';
import 'package:krishi_sathi/src/features/chat/domain/repositories/chat_repository.dart';

class ChatRemoteRepository implements ChatRepository {
  final ChatDatasource chatDatasource;

  ChatRemoteRepository({required this.chatDatasource});
  @override
  Future<Either<Failure, MessageEntity>> getMessage(File media) async {
    try {
      final MessageModel messageModel = await chatDatasource.getMessage(media);
      return Right(messageModel.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
