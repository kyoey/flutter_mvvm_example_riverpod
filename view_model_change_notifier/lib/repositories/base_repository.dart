import 'package:flutter_mvvm_example/apis/http_client.dart';

abstract class BaseRepositoryInterface {
  late HttpClient client;
}

abstract class BaseRepository implements BaseRepositoryInterface {
  // final DebugModel debugModel;
  //
  // BaseRepository(this.debugModel) {
  //   debugModel?.stream?.listen((state) {
  //     client = HttpClient(
  //       Dio(DioBaseOptions.httpClient),
  //       baseUrl: state.debugType.scalaUrl,
  //     );
  //     rubyClient = RubyHttpClient(
  //       Dio(DioBaseOptions.rubyHttpClient),
  //       baseUrl: state.debugType.rubyUrl,
  //     );
  //   });
  // }
}
