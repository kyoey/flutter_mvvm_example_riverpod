import 'package:flutter_mvvm_example/models/app_state/app_state.dart';
import 'package:flutter_mvvm_example/models/controllers/model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ModelのProvider
final appModelProvider = StateNotifierProvider<AppModel, AppState>(
  (ref) => AppModel(),
);

/// Model
class AppModel extends Model<AppState> {
  AppModel() : super(AppState());

  Future updateTitle(String title) async {
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(title: title);
  }

  Future updateDescription(String description) async {
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(description: description);
  }
}
