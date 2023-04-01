import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final int maxLenght;
  final double? width;

  const TextForm(
      {Key? key,
      this.hintText,
      required this.labelText,
      required this.maxLenght,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: width ?? size.width * 1,
      height: size.height * 0.073,
      child: TextFormField(
        maxLength: maxLenght,
        decoration: InputDecoration(
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          labelText: labelText,
          counterText: '',
          labelStyle: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
