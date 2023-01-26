import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:dio/dio.dart';

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete,
}

class AppRequest {
  AppRequest({
    required this.url,
    this.payload,
    this.method = HttpMethod.get,
  });

  final String url;
  final Map<String, dynamic>? payload;
  final HttpMethod method;
}

class AppResponse {
  AppResponse.success({
    @required this.rawResponse,
    @required this.status,
  }) : isValid = true;

  AppResponse.failed()
      : isValid = false,
        status = null,
        rawResponse = null;

  final Map<String, dynamic>? rawResponse;
  final int? status;

  final bool isValid;
}

class AppHttpClient {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  // Example: Übergabe der BaseOptions an Konstruktor
  // final Dio _client = Dio(
  //   BaseOptions(
  //     baseUrl: _baseUrl,
  //   ),
  // );

  final Dio _client = Dio()..options.baseUrl = _baseUrl;

  Future<AppResponse> get(AppRequest request) async {
    try {
      final result = await _client.get(request.url);
      // Example: dio Query Parameters
      // final result = await _client.get(
      //   '/comments',
      //   queryParameters: {
      //     'postId': '1',
      //   },
      // );
      final toDecodedJson = result.data;

      return AppResponse.success(
        rawResponse: toDecodedJson,
        status: result.statusCode,
      );
    } catch (e) {
      print(e);
      return AppResponse.failed();
    }
  }

  void _cancelExample() {
    final cancelToken = CancelToken();

    _client.get('/todos/1', cancelToken: cancelToken).then((response) {
      // ... es vergehen einige Sekunden bis das Ergebnis ankommt
      print(response.data);
    });

    // ...

    // Den Request abbrechen
    cancelToken.cancel();
  }

  void _progressExample() async {
    final result = await _client.post(
      '/posts',
      onReceiveProgress: (current, total) {
        print('Es wurden $current von $total Bytes empfangen');
      },
      onSendProgress: (current, total) {
        print('Bereits ${current / total} % abgeschlossen');
      },
    );

    // ...
  }

  Future<AppResponse> post(AppRequest request) async {
    try {
      final result = await _client.post(
        request.url,
        data: request.payload,
      );

      // Example: options in dio Requests
      // final result = await _client.post(
      //   request.url,
      //   data: request.payload,
      //   // bspw. Timeout beim Senden von 500ms
      //   options: Options(
      //     sendTimeout: 500,
      //     // ...
      //   ),
      // );

      final toDecodedJson = result.data;
      return AppResponse.success(
        rawResponse: toDecodedJson,
        status: result.statusCode,
      );
    } catch (e) {
      print(e);
      return AppResponse.failed();
    }
  }
}
