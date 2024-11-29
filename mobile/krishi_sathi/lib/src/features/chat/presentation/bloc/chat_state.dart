part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

class MessageLoading extends ChatState {
  const MessageLoading();
}

class MessageLoadingSuccess extends ChatState {
  final MessageEntity message;
  const MessageLoadingSuccess({required this.message});
}

class MessageLoadingFailed extends ChatState {
  final String message;
  const MessageLoadingFailed(this.message);
}
