import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final String text1;
  final String text2;

  const ToggleButton({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  List<bool> isSelected = [false, true];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ToggleButtons(
      constraints: BoxConstraints(
          minWidth: size.width * 0.4 / 2, minHeight: size.height * 0.05),
      selectedColor: Colors.white,
      fillColor: const Color.fromARGB(255, 104, 181, 245),
      color: Colors.grey,
      renderBorder: false,
      borderRadius: BorderRadius.circular(12),
      isSelected: isSelected,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(widget.text1),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(widget.text2),
        )
      ],
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = true;
            } else {
              isSelected[index] = false;
            }
          }
        });
      },
    );
  }
}
