import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/choicechip_data.dart';

class ChoiceChips {
  static final all = <ChoiceChipData>[
    ChoiceChipData(
      label: 'Overview',
      isSelected: true,
      selectedColor: Colors.blue,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Leaderboard',
      isSelected: false,
      selectedColor: Colors.blue,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Transactions',
      isSelected: false,
      selectedColor: Colors.blue,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Me',
      isSelected: false,
      selectedColor: Colors.blue,
      textColor: Colors.white,
    ),
  ];
}
