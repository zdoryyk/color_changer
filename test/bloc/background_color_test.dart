import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_flutter/features/welcome/bloc/background_color/background_color_cubit.dart';
import 'package:test_flutter/features/welcome/models/color_model.dart';
import 'package:test_flutter/features/welcome/repositories/shared_prefs_repository.dart';
import 'package:test_flutter/features/welcome/util/color_generator.dart';

class MockStorage extends Mock implements Storage {}

late Storage hydratedStorage;

class MockSharedPreferencesRepo extends Mock
    implements SharedPrefsColorRepository {}

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
    final mockSharedPrefsRepo = MockSharedPreferencesRepo();
    final mockColorGenerator = MockColorGenerator();
    blocTest<BackgroundColorCubit, BackgroundColorState>(
      'Should change color state to new color',
      build:
          () => BackgroundColorCubit(
            repository: mockSharedPrefsRepo,
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
