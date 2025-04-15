part of 'background_color_cubit.dart';

sealed class BackgroundColorState extends Equatable {
  final ColorModel color;
  const BackgroundColorState({required this.color});

  @override
  List<Object> get props => [];
}

final class BackgroundColorInitial extends BackgroundColorState {
  const BackgroundColorInitial({required super.color});

  @override
  List<Object> get props => [color];
}

final class BackgroundColorChange extends BackgroundColorState {
  const BackgroundColorChange({required super.color});

  @override
  List<Object> get props => [color];
}
