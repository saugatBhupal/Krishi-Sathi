import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:krishi_sathi/src/features/chat/domain/entities/message.dart';
import 'package:krishi_sathi/src/features/chat/domain/usecases/get_message_usecase.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetMessageUsecase getMessageUsecase;

  ChatBloc({
    required this.getMessageUsecase,
  }) : super(ChatInitial()) {
    on<ChatEvent>((event, emit) async {
      if (event is GetMessage) {
        await _GetMessage(event, emit);
      }
    });
  }

  _GetMessage(GetMessage event, Emitter<ChatState> emit) async {
    emit(const MessageLoading());
    final result = await getMessageUsecase(event.media);
    result.fold(
      (failure) => emit(MessageLoadingFailed(failure.message)),
      (success) => emit(MessageLoadingSuccess(message: success)),
    );
  }
}
