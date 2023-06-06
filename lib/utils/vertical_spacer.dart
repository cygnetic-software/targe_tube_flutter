import 'package:flutter/material.dart';

class VerticalSpacer extends StatelessWidget {
  late final size;
  VerticalSpacer(double size) {
    this.size = size;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.size,
    );
  }
}
