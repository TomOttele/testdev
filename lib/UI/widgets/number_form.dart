import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberForm extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final int maxLenght;
  final double? width;

  const NumberForm(
      {Key? key,
      this.hintText,
      required this.labelText,
      required this.maxLenght,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.093,
          width: width ?? size.width * 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
          ),
          child: TextFormField(
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
              labelStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
