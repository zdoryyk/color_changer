// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

import 'package:test_flutter/features/welcome/repositories/repository_interface.dart';

class SharedPrefsColorRepository extends RepositoryInterface<String> {
  final SharedPreferences sharedPreferences;

  SharedPrefsColorRepository({required this.sharedPreferences});
  @override
  List<String> getAll() {
    return sharedPreferences.getStringList('colors') ?? [];
  }

  @override
  void save(String valueToSave) {
    final colors = getAll();
    if (colors.isNotEmpty) {
      if (colors.any((color) => color == valueToSave)) {
        return;
      }
      sharedPreferences.setStringList('colors', [valueToSave, ...colors]);
    } else {
      sharedPreferences.setStringList('colors', [valueToSave]);
    }
  }

  @override
  void remove(String valueToRemove) {
    final colors = getAll();
    sharedPreferences.setStringList('colors', [
      ...colors.where((color) => color != valueToRemove),
    ]);
  }
}
