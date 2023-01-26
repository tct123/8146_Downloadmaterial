import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete,
}

class AppRequest {
  AppRequest({
    @required this.url,
    this.payload,
    this.method = HttpMethod.get,
  });

  final String url;
  final Map<String, dynamic> payload;
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

  final Map<String, dynamic> rawResponse;
  final int status;

  final bool isValid;
}

class AppHttpClient {
  static const String _baseUrl = 'jsonplaceholder.typicode.com';

  final Client _client = Client();

  Future<AppResponse> get(AppRequest request) async {
    try {
      final uri = Uri.https(_baseUrl, request.url);
      final result = await _client.get(uri);
      final toDecodedJson = json.decode(result.body);

      return AppResponse.success(
        rawResponse: toDecodedJson,
        status: result.statusCode,
      );
    } catch (e) {
      print(e);
      return AppResponse.failed();
    }
  }

  Future<AppResponse> post(AppRequest request) async {
    try {
      final uri = Uri.https(_baseUrl, request.url);
      final result = await _client.post(
        uri,
        body: json.encode(request.payload),
      );

      final toDecodedJson = json.decode(result.body);
      return AppResponse.success(
        rawResponse: toDecodedJson,
        status: result.statusCode,
      );
    } catch (e) {
      print(e);
      return AppResponse.failed();
    }
  }

  Future<AppResponse> send(AppRequest request) async {
    try {
      final uri = Uri.https(_baseUrl, request.url);
      final encodedJson = json.encode(request.payload);

      Response result;
      switch (request.method) {
        case HttpMethod.post:
          result = await _client.post(uri, body: encodedJson);
          break;
        case HttpMethod.put:
          result = await _client.put(uri, body: encodedJson);
          break;
        case HttpMethod.patch:
          result = await _client.patch(uri, body: encodedJson);
          break;
        case HttpMethod.delete:
          result = await _client.delete(uri);
          break;
        default:
          // Wird hier nicht behandelt, falsche Methode!
          return AppResponse.failed();
      }

      final toDecodedJson = json.decode(result.body);
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
