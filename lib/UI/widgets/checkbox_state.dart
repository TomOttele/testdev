import 'package:flutter/material.dart';

class CheckBoxState {
  final String title;
  final String subtitle;
  final IconData icon;
  bool value;

  CheckBoxState(
      {required this.title,
      required this.subtitle,
      required this.icon,
      this.value = false});
}
