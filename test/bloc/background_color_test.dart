import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/features/welcome/bloc/background_color/background_color_cubit.dart';
import 'package:test_flutter/features/welcome/models/color_model.dart';
import 'package:test_flutter/features/welcome/util/color_generator.dart';

class MockStorage extends Mock implements Storage {}

late Storage hydratedStorage;

class MockSharedPreferences extends Mock implements SharedPreferences {
  @override
  Future<bool> setStringList(String key, List<String> value) {
    return Future.value(true);
  }
}

class MockColorGenerator extends Mock implements ColorGenerator {}

void initHydratedStorage() {
  TestWidgetsFlutterBinding.ensureInitialized();
  hydratedStorage = MockStorage();
  when(
    () => hydratedStorage.write(any(), any<dynamic>()),
  ).thenAnswer((_) async {});
  HydratedBloc.storage = hydratedStorage;
}

void main() async {
  initHydratedStorage();
  group('Background Cubit test', () {
    final mockSharedPrefs = MockSharedPreferences();
    final mockColorGenerator = MockColorGenerator();
    blocTest<BackgroundColorCubit, BackgroundColorState>(
      'Should change color state to new color',
      build:
          () => BackgroundColorCubit(
            sharedPreferences: mockSharedPrefs,
            colorGenerator: mockColorGenerator,
          ),
      setUp: () {
        when(
          () => mockColorGenerator.generateRandomColor(),
        ).thenAnswer((_) => ColorModel(r: 1, g: 1, b: 1));
      },
      act: (bloc) => bloc.onNextColor(),
      expect:
          () => [BackgroundColorChange(color: ColorModel(r: 1, g: 1, b: 1))],
    );
  });
}
