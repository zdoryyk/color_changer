import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/core/get_it.dart';
import 'package:test_flutter/features/welcome/presentation/bloc/background_color/background_color_cubit.dart';

class BlocInitializator extends StatelessWidget {
  const BlocInitializator({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BackgroundColorCubit>(create: (context) => locator.get()),
      ],
      child: child,
    );
  }
}
