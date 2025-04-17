import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:test_flutter/features/welcome/models/color_model.dart';
import 'package:test_flutter/features/welcome/repositories/repository_interface.dart';
import 'package:test_flutter/features/welcome/util/color_generator.dart';

part 'background_color_state.dart';

// I have changed my code, implemented repository
class BackgroundColorCubit extends HydratedCubit<BackgroundColorState> {
  final RepositoryInterface repository;
  final IColorGenerator colorGenerator;
  BackgroundColorCubit({required this.repository, required this.colorGenerator})
    : super(BackgroundColorInitial(color: ColorModel.initial()));

  void onNextColor() {
    final newColor = colorGenerator.generateRandomColor();
    repository.save(state.color.toString());
    emit(BackgroundColorChange(color: newColor));
  }

  void onPreviusColor() {
    final lastColor = _getPreviousColor();
    emit(BackgroundColorChange(color: lastColor));
  }

  ColorModel _getPreviousColor() {
    final colors = repository.getAll();
    final lastColor = colors.first;
    if (colors.length > 1) {
      repository.remove(lastColor);
    }
    return ColorModel.fromString(lastColor);
  }

  @override
  BackgroundColorState? fromJson(Map<String, dynamic> json) {
    final color = json['color'] as Map<String, dynamic>;
    return BackgroundColorInitial(color: ColorModel.fromJson(color));
  }

  @override
  Map<String, dynamic>? toJson(BackgroundColorState state) {
    return {'color': state.color.toJson()};
  }
}
