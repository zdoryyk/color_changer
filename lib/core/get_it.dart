import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/features/welcome/bloc/background_color/background_color_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter/features/welcome/repositories/repository_interface.dart';
import 'package:test_flutter/features/welcome/repositories/shared_prefs_repository.dart';
import 'package:test_flutter/features/welcome/util/color_generator.dart';

final locator = GetIt.instance;

Future<void> getItInit() async {
  await _initComponents();
  await _initBlocs();
}

Future<void> _initComponents() async {
  locator.registerSingleton<IColorGenerator>(ColorGenerator());
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
  locator.registerSingleton<RepositoryInterface>(
    SharedPrefsColorRepository(sharedPreferences: locator.get()),
  );
}

Future<void> _initBlocs() async {
  locator.registerSingleton<BackgroundColorCubit>(
    BackgroundColorCubit(
      repository: locator.get<RepositoryInterface>(),
      colorGenerator: locator.get(),
    ),
  );
}
