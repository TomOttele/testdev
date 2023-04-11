import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/xchoicechip_data.dart';
import 'package:testdev/application/theme_Service.dart';
import 'package:testdev/theme.dart';

class ChoiceChips {
  static final all = <ChoiceChipData>[
    ChoiceChipData(
      label: 'Overview',
      isSelected: true,
      selectedColor: Colors.grey,
      textColor: Colors.white,
      unselectedColor: Colors.black,
    ),
    ChoiceChipData(
      label: 'Leaderboard',
      isSelected: false,
      selectedColor: Colors.grey,
      textColor: Colors.white,
      unselectedColor: Colors.black,
    ),
    ChoiceChipData(
      label: 'Transactions',
      isSelected: false,
      selectedColor: Colors.grey,
      textColor: Colors.green,
      unselectedColor: Colors.black,
    ),
    ChoiceChipData(
      label: 'Me',
      isSelected: false,
      selectedColor: Colors.grey,
      textColor: Colors.white,
      unselectedColor: Colors.black,
    ),
  ];
}
