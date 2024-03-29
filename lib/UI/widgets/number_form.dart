import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberForm extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final int maxLenght;
  final double? width;

  const NumberForm(
      {Key? key,
      this.hintText,
      required this.labelText,
      required this.maxLenght,
      this.width,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Theme.of(context).colorScheme.onPrimary,
            height: size.height * 0.073,
            width: width ?? size.width * 1,
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: maxLenght,
              decoration: InputDecoration(
                border: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hintText,
                filled: true,
                fillColor: Theme.of(context).colorScheme.onPrimary,
                labelText: labelText,
                counterText: '',
                labelStyle: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
