part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class GetMessage extends ChatEvent {
  final File media;

  const GetMessage({required this.media});
}

class GetAudio extends ChatEvent {
  final String text;

  const GetAudio({required this.text});
}
