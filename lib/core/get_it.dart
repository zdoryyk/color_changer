import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/features/welcome/bloc/background_color/background_color_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter/features/welcome/util/color_generator.dart';

final locator = GetIt.instance;

Future<void> getItInit() async {
  await _initComponents();
  await _initBlocs();
}

Future<void> _initComponents() async {
  locator.registerSingleton<ColorGenerator>(ColorGenerator());
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
}

Future<void> _initBlocs() async {
  locator.registerSingleton<BackgroundColorCubit>(
    BackgroundColorCubit(
      sharedPreferences: locator.get<SharedPreferences>(),
      colorGenerator: locator.get(),
    ),
  );
}
