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
  List<String> selectedTags = [];
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

  void addTag(String tag) {
    setState(() {
      selectedTags.add(tag);
    });
  }

  void removeTag(String tag) {
    setState(() {
      selectedTags.remove(tag);
    });
  }

  bool isTagSelected(String tag) {
    return selectedTags.contains(tag);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Wrap(
            spacing: 8.0,
            children: selectedTags.map((tag) {
              return Chip(
                label: Text(tag),
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                labelStyle: const TextStyle(color: Colors.white),
                deleteIconColor: const Color.fromARGB(255, 109, 109, 109),
                onDeleted: () {
                  removeTag(tag);
                },
              );
            }).toList(),
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          ChipsChoice.multiple(
            value: selectedTags,
            onChanged: (val) {
              for (String tag in val) {
                if (!isTagSelected(tag)) {
                  addTag(tag);
                }
              }
              for (String tag in selectedTags) {
                if (!val.contains(tag)) {
                  removeTag(tag);
                }
              }
            },
            choiceItems: C2Choice.listFrom(
              source: options,
              value: (i, v) => v,
              label: (i, v) => v,
            ),
            choiceStyle: C2ChipStyle.filled(
              color: Colors.black,
              selectedStyle: const C2ChipStyle(backgroundColor: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
