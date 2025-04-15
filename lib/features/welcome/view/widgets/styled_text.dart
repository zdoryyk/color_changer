// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_flutter/core/app_colors.dart';

class StyledText extends StatelessWidget {
  const StyledText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppColors.text.primaryTextStyle.copyWith(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
