import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';

class ChoiceChipsMS extends StatefulWidget {
  const ChoiceChipsMS({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoiceChipsMS> createState() => _ChoiceChipsMSState();
}

class _ChoiceChipsMSState extends State<ChoiceChipsMS> {
  int tag = 1;
  List<String> tags = [];
  List<String> options = [
    'GK',
    'RB',
    'CB',
    'LF',
    'CDM',
    'COM',
    'CM',
    'LW',
    'RW',
    'ST',
    'CO',
    'TT'
  ];
  @override
  Widget build(BuildContext context) {
    return ChipsChoice.multiple(
      choiceCheckmark: true,
      value: tags,
      onChanged: (val) => setState(() => tags = val),
      choiceItems: C2Choice.listFrom(
          source: options, value: (i, v) => v, label: (i, v) => v),
      choiceStyle: C2ChipStyle.filled(
        color: Theme.of(context).colorScheme.primary,
        selectedStyle: C2ChipStyle(
            backgroundColor: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
