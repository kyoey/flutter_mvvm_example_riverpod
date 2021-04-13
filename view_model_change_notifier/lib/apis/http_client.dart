import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'http_client.g.dart';

@RestApi(baseUrl: 'https://api.github.com/users/octocat/orgs')
abstract class HttpClient {
  factory HttpClient(Dio dio, {String baseUrl}) = _HttpClient;

  @GET('')
  Future fetchHoge();
}
