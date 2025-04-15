import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/core/constants.dart';
import 'package:test_flutter/features/welcome/models/color_model.dart';
import 'package:test_flutter/features/welcome/presentation/bloc/background_color/background_color_cubit.dart';
import 'package:test_flutter/features/welcome/presentation/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BackgroundColorCubit, BackgroundColorState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.color.toColor(),
          body: Stack(
            children: [
              CustomScreenDivider(
                onPressedLeft: () {
                  context.read<BackgroundColorCubit>().onPreviusColor();
                },
                onPressedRight: () {
                  context.read<BackgroundColorCubit>().onNextColor();
                },
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledText(text: 'Hey'),
                    SizedBox(width: deviceInfo.width * .02),
                    StyledText(text: 'there!'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
