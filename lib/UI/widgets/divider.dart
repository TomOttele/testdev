import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Divider(
      height: 20,
      thickness: 1,
      color: const Color.fromARGB(255, 90, 90, 90),
      indent: size.width * 0.17,
    );
  }
}
