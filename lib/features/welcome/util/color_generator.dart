import 'dart:math';

import 'package:test_flutter/features/welcome/models/color_model.dart';

class ColorGenerator {
  ColorModel generateRandomColor() {
    final random = Random();
    final r = random.nextInt(256);
    final g = random.nextInt(256);
    final b = random.nextInt(256);
    return ColorModel(r: r, g: g, b: b);
  }
}
