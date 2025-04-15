import 'dart:math';
import 'dart:ui';

import 'package:equatable/equatable.dart';

// Created fast this model, decided to not implement Color Entity
class ColorModel extends Equatable {
  final int r;
  final int g;
  final int b;

  const ColorModel({required this.r, required this.g, required this.b});

  const ColorModel.initial() : r = 0, g = 0, b = 0;

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      r: json['r'] as int,
      g: json['g'] as int,
      b: json['b'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'r': r, 'g': g, 'b': b};
  }

  factory ColorModel.fromString(String colorString) {
    final parts = colorString.split(',');
    if (parts.length != 3) {
      throw FormatException('Invalid color string format. Expected "r,g,b".');
    }
    return ColorModel(
      r: int.parse(parts[0]),
      g: int.parse(parts[1]),
      b: int.parse(parts[2]),
    );
  }

  static ColorModel generateRandomColor() {
    final random = Random();
    final r = random.nextInt(256);
    final g = random.nextInt(256);
    final b = random.nextInt(256);
    return ColorModel(r: r, g: g, b: b);
  }

  @override
  String toString() {
    return '$r,$g,$b';
  }

  @override
  List<Object?> get props => [r, g, b];
}

extension ToColor on ColorModel {
  Color toColor() {
    return Color.fromARGB(255, r, g, b);
  }
}
