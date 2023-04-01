import 'package:flutter/material.dart';

class ChoiceChipData {
  final String label;
  final bool isSelected;
  Color textColor;
  Color selectedColor;
  Color unselectedColor;

  ChoiceChipData(
      {required this.label,
      required this.isSelected,
      required this.textColor,
      required this.selectedColor,
      required this.unselectedColor});

  ChoiceChipData copy(
          {required String label,
          required bool isSelected,
          required Color textColor,
          required Color selectedColor,
          required Color unselectedColor}) =>
      ChoiceChipData(
          label: label,
          isSelected: isSelected,
          textColor: textColor,
          selectedColor: selectedColor,
          unselectedColor: unselectedColor);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChoiceChipData &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          isSelected == other.isSelected &&
          textColor == other.textColor &&
          selectedColor == other.selectedColor;

  @override
  int get hashCode =>
      label.hashCode ^
      isSelected.hashCode ^
      textColor.hashCode ^
      selectedColor.hashCode;
}
