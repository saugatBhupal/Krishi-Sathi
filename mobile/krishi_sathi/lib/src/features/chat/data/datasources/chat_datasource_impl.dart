import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:krishi_sathi/src/core/error/failure.dart';
import 'package:krishi_sathi/src/core/http/api_endpoints.dart';
import 'package:krishi_sathi/src/core/http/handle_error_response.dart';
import 'package:krishi_sathi/src/features/chat/data/datasources/chat_datasource.dart';
import 'package:krishi_sathi/src/features/chat/data/models/message_model.dart';

class ChatDatasourceImpl implements ChatDatasource {
  final Dio dio;

  ChatDatasourceImpl({required this.dio});

  @override
  Future<MessageModel> getMessage(File media) async {
    try {
      FormData mediaData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          media.path,
          filename: media.path.split('/').last,
        ),
      });

      final res = await dio.post(ApiEndpoints.uploadImage, data: mediaData);

      if (res.statusCode == 200) {
        return MessageModel.fromJson(
            jsonDecode(res.data) as Map<String, dynamic>);
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      print("DioException: ${e.message}");
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<int>> getAudio(String text) async {
    try {
      final response = await dio.post(
        ApiEndpoints.getAudio,
        data: jsonEncode({"text": text}),
        options: Options(
          headers: {'Content-Type': 'application/json'},
          responseType: ResponseType.bytes,
        ),
      );

      if (response.statusCode == 200) {
        return response.data as List<int>;
      } else {
        throw Failure(
          message: response.statusMessage ?? 'Unknown error',
          statusCode: response.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      print("DioException: ${e.message}");
      return await handleErrorResponse(e);
    }
  }
}
