// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$NewsApiService extends NewsApiService {
  _$NewsApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NewsApiService;

  @override
  Future<Response<dynamic>> fetchNews(
    String from,
    String to, {
    String topic = "technology",
    String sortBy = "popularity",
    String language = "en",
    required String apiKey,
  }) {
    final Uri $url = Uri.parse('/everything');
    final Map<String, dynamic> $params = <String, dynamic>{
      'from': from,
      'to': to,
      'q': topic,
      'sortBy': sortBy,
      'language': language,
      'apiKey': apiKey,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
