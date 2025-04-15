import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/features/welcome/presentation/bloc/background_color/background_color_cubit.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> getItInit() async {
  await _initComponents();
  await _initBlocs();
}

Future<void> _initComponents() async {
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
}

Future<void> _initBlocs() async {
  locator.registerSingleton<BackgroundColorCubit>(
    BackgroundColorCubit(sharedPreferences: locator.get<SharedPreferences>()),
  );
}
