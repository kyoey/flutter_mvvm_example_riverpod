import 'package:dio/dio.dart';
import 'package:flutter_mvvm_example/apis/http_client.dart';
import 'package:flutter_mvvm_example/models/debug/debug_model.dart';
import 'package:flutter_mvvm_example/repositories/base_repository.dart';
import 'package:flutter_mvvm_example/models/debug/debug_data.dart';
import 'package:riverpod/riverpod.dart';

/// RepositoryのProvider
/// DebugTypeを参照
final hogeRepositoryProvider = Provider(
  (ref) => HogeRepository(
    client: HttpClient(
      Dio(),
      baseUrl: ref.watch(debugStateProvider).state.debugType.baseUrl,
    ),
  ),
);

/// Repository
class HogeRepository extends BaseRepository {
  @override
  HttpClient client;

  HogeRepository({
    required this.client,
  });

  Future<bool> fetchHoge() async {
    try {
      final response = await client.fetchHoge();
      print('成功');
      print(response);
      return true;
    } catch (error) {
      print('エラー');
      print(error);
      return false;
    }
  }
}
