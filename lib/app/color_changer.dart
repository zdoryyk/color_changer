import 'package:flutter/material.dart';
import 'package:test_flutter/app/bloc_initializator.dart';
import 'package:test_flutter/core/constants.dart';
import 'package:test_flutter/core/device_info.dart';
import 'package:test_flutter/features/welcome/view/screens/view.dart';

class ColorChanger extends StatelessWidget {
  const ColorChanger({super.key});

  @override
  Widget build(BuildContext context) {
    deviceInfo = DeviceInfo(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
    return BlocInitializator(child: const MaterialApp(home: WelcomeScreen()));
  }
}
