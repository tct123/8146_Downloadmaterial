import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_examples/app_http_client.dart';
import 'package:http_examples/app_http_client_dio.dart' as Dio;
import 'package:http_examples/todo_dto.dart';

import 'webview/flutter_inappwebview_example.dart';

void main() {
  // HttpClient
  // runApp(MyApp());

  // Webview: webview_flutter
  // WidgetsFlutterBinding.ensureInitialized();
  // runApp(WebviewFlutterExample());
  // Webview: flutter_inappwebview
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(InAppWebViewExample());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: HttpClientExample()),
    );
  }
}

class HttpClientExample extends StatefulWidget {
  @override
  _HttpClientExampleState createState() => _HttpClientExampleState();
}

class _HttpClientExampleState extends State<HttpClientExample> {
  var httpClient = AppHttpClient();
  var dioHttpClient = Dio.AppHttpClient();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: fetchFirstTodo,
            child: Text('Fetch'),
          ),
          ElevatedButton(
            onPressed: postPosts,
            child: Text('Post'),
          ),
          ElevatedButton(
            onPressed: putPosts,
            child: Text('Put'),
          ),
          ElevatedButton(
            onPressed: patchPosts,
            child: Text('Patch'),
          ),
          ElevatedButton(
            onPressed: patchPosts,
            child: Text('Delete'),
          ),
          ElevatedButton(
            onPressed: fetchWithHttpClient,
            child: Text('Fetch Client'),
          ),
          ElevatedButton(
            onPressed: postWithHttpClient,
            child: Text('Post Client'),
          ),
          ElevatedButton(
            onPressed: sendWithHttpClient,
            child: Text('Send Client'),
          ),
          ElevatedButton(
            onPressed: activateProxy,
            child: Text('Activate Proxy'),
          ),
          ElevatedButton(
            onPressed: fetchFirstTodoWithDio,
            child: Text('Dio get'),
          ),
        ],
      ),
    );
  }

  Future<void> fetchFirstTodo() async {
    final baseUrl = 'jsonplaceholder.typicode.com';
    final uri = Uri.https(baseUrl, 'todos/1');
    // Beispiel: postId Query Parameter
    // final uri = Uri.https(
    //   baseUrl,
    //   'comments',
    //   {
    //     'postId': '1',
    //   },
    // );
    http.Response data = await http.get(uri);
    // Beispiel: HttpHeader
    // http.Response data = await http.get(uri, headers: {
    //   HttpHeaders.authorizationHeader: 'Bearer i2k...',
    // });
    print(data.body);

    final dto = TodoDto.fromJson(json.decode(data.body));
    print(dto);
  }

  Future<void> postPosts() async {
    final baseUrl = 'jsonplaceholder.typicode.com';
    final uri = Uri.https(baseUrl, 'posts');

    final jsonMap = {
      "userId": 1,
      "id": 1,
      "title": "Der Titel des Posts",
      "body": "Kurz gefasst: der Inhalt"
    };

    http.Response data = await http.post(
      uri,
      body: json.encode(jsonMap),
    );

    print('Status code: ${data.statusCode}');
  }

  Future<void> putPosts() async {
    final baseUrl = 'jsonplaceholder.typicode.com';
    final uri = Uri.https(baseUrl, 'posts/1');

    final jsonMap = {
      "userId": 1,
      "id": 1,
      "title": "Der aktualisierte Titel des Posts",
      "body": "Kurz gefasst: der Inhalt, aber etwas länger"
    };

    http.Response data = await http.put(
      uri,
      body: json.encode(jsonMap),
    );

    print('Status code: ${data.statusCode}');
  }

  Future<void> patchPosts() async {
    final baseUrl = 'jsonplaceholder.typicode.com';
    final uri = Uri.https(baseUrl, 'posts/1');

    final jsonMap = {"id": 1, "title": "Ein neuer Titel"};

    http.Response data = await http.patch(
      uri,
      body: json.encode(jsonMap),
    );

    print('Status code: ${data.statusCode}');
  }

  Future<void> deletePosts() async {
    final baseUrl = 'jsonplaceholder.typicode.com';
    final uri = Uri.https(baseUrl, 'posts/1');

    http.Response response = await http.delete(uri);

    print('Status code: ${response.statusCode}');
  }

  Future<void> fetchWithHttpClient() async {
    final request = AppRequest(url: 'todos/1', payload: {});
    final response = await httpClient.get(request);
    print(response.rawResponse);
  }

  Future<void> postWithHttpClient() async {
    final jsonMap = {
      "userId": 1,
      "id": 1,
      "title": "Der Titel des Posts",
      "body": "Kurz gefasst: der Inhalt"
    };
    final request = AppRequest(url: 'posts', payload: jsonMap);
    final response = await httpClient.post(request);

    print('Data: ${response.rawResponse}, Status Code: ${response.status}');
  }

  Future<void> sendWithHttpClient() async {
    final jsonMap = {
      "userId": 1,
      "id": 1,
      "title": "Der Titel des Posts",
      "body": "Kurz gefasst: der Inhalt"
    };
    final postRequest = AppRequest(
      url: 'posts',
      payload: jsonMap,
      method: HttpMethod.post,
    );
    final postResponse = await httpClient.send(postRequest);

    print(
        'Data: ${postResponse.rawResponse}, Status Code: ${postResponse.status}');

    final putRequest = AppRequest(
      url: 'posts',
      payload: jsonMap,
      method: HttpMethod.put,
    );
    final putResponse = await httpClient.send(putRequest);

    print(
        'Data: ${putResponse.rawResponse}, Status Code: ${putResponse.status}');

    final patchRequest = AppRequest(
      url: 'posts',
      payload: jsonMap,
      method: HttpMethod.patch,
    );
    final patchResponse = await httpClient.send(patchRequest);

    print(
        'Data: ${patchResponse.rawResponse}, Status Code: ${patchResponse.status}');

    final deleteRequest = AppRequest(
      url: 'posts/1',
      method: HttpMethod.delete,
      payload: {},
    );

    final deleteResult = await httpClient.send(deleteRequest);
    print(
      'Data: ${deleteResult.rawResponse}, Status Code: ${deleteResult.status}',
    );
  }

  void activateProxy() {
    HttpOverrides.global = ProxyHttpOverride();
    httpClient = AppHttpClient();
  }

  Future<void> fetchFirstTodoWithDio() async {
    final request = Dio.AppRequest(url: '/todos/1', payload: {});
    final response = await dioHttpClient.get(request);
    print(response.rawResponse);
  }

  Future<void> postWithDio() async {
    final jsonMap = {
      "userId": 1,
      "id": 1,
      "title": "Der Titel des Posts",
      "body": "Kurz gefasst: der Inhalt"
    };

    final request = Dio.AppRequest(url: '/posts', payload: jsonMap);
    final response = await dioHttpClient.get(request);
    print(response.rawResponse);
  }
}

class ProxyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return "PROXY 192.168.2.150:8888;";
      }
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
