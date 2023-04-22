import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final double height;

  const Separator({super.key, this.height = 25});
  Separator copy({double? height}) => Separator(height: height ?? this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
