import 'package:flutter/material.dart';
import 'package:test_flutter/core/constants.dart';

class CustomScreenDivider extends StatelessWidget {
  const CustomScreenDivider({
    super.key,
    required this.onPressedLeft,
    required this.onPressedRight,
    this.leftChild,
    this.rightChild,
  });

  final Widget? leftChild;
  final Widget? rightChild;
  final VoidCallback onPressedLeft;
  final VoidCallback onPressedRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressedLeft,
          child: SizedBox(
            height: deviceInfo.height,
            width: deviceInfo.width / 2,
            child: leftChild,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressedRight,
          child: SizedBox(
            height: deviceInfo.height,
            width: deviceInfo.width / 2,
            child: rightChild,
          ),
        ),
      ],
    );
  }
}
