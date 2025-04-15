import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/features/welcome/models/color_model.dart';

part 'background_color_state.dart';

// I know its not the best practice to use logic with save colors inside Bloc/Cubit,
// I didnt have a lot of time ot end this task
class BackgroundColorCubit extends HydratedCubit<BackgroundColorState> {
  final SharedPreferences sharedPreferences;
  BackgroundColorCubit({required this.sharedPreferences})
    : super(BackgroundColorInitial(color: ColorModel.initial()));

  void onNextColor() {
    final newColor = ColorModel.generateRandomColor();
    _saveColor(state.color.toString());
    emit(BackgroundColorChange(color: newColor));
  }

  void onPreviusColor() {
    final lastColor = _getPreviousColor();
    emit(BackgroundColorChange(color: lastColor));
  }

  ColorModel _getPreviousColor() {
    final colors = sharedPreferences.getStringList('colors') ?? [];
    log(colors.toString());
    final lastColor = colors.first;
    if (colors.length > 1) {
      sharedPreferences.setStringList('colors', [
        ...colors.where((color) => color != lastColor),
      ]);
    }
    return ColorModel.fromString(lastColor);
  }

  void _saveColor(String newColor) {
    final colors = sharedPreferences.getStringList('colors') ?? [];
    if (colors.isNotEmpty) {
      if (colors.any((color) => color == newColor)) {
        return;
      }
      sharedPreferences.setStringList('colors', [
        newColor.toString(),
        ...colors,
      ]);
    } else {
      sharedPreferences.setStringList('colors', [newColor.toString()]);
    }
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
