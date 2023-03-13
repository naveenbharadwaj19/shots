import 'package:chopper/chopper.dart';

part 'news_api.chopper.dart';

String baseUrl = "https://newsapi.org/v2";

@ChopperApi()
abstract class NewsApiService extends ChopperService {
  @Get(path: "/everything")
  Future<Response> fetchNews(
    @Query() String from,
    @Query() String to, {
    @Query("q") String topic = "technology",
    @Query() String sortBy = "popularity",
    @Query() String language = "en",
    @Query() required String apiKey,
  });

  static NewsApiService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(baseUrl),
      services: [
        _$NewsApiService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
    );
    return _$NewsApiService(client);
  }
}
