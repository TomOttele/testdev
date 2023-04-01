import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  List<bool> isSelected = [false, true];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ToggleButtons(
      selectedColor: Colors.white,
      fillColor: Color.fromARGB(255, 104, 181, 245),
      color: Colors.transparent,
      renderBorder: false,
      borderRadius: BorderRadius.circular(12),
      isSelected: isSelected,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Left', style: Theme.of(context).textTheme.bodyMedium),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Right', style: Theme.of(context).textTheme.bodyMedium),
        )
      ],
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < isSelected.length; index++)
            if (index == newIndex) {
              isSelected[index] = true;
            } else {
              isSelected[index] = false;
            }
        });
      },
    );
  }
}
