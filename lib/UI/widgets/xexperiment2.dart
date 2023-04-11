import 'package:flutter/material.dart';
import 'xExpriment.dart';

class MyBottomSheet extends StatefulWidget {
  final List<String> selectedOptions;

  MyBottomSheet({required this.selectedOptions});

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState(selectedOptions);
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  List<String> _options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];
  List<String> _selectedOptions;

  _MyBottomSheetState(this._selectedOptions);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: _options.length,
        itemBuilder: (BuildContext context, int index) {
          final option = _options[index];
          return CheckboxListTile(
            title: Text(option),
            value: _selectedOptions.contains(option),
            onChanged: (value) {
              _onOptionSelected(option);
            },
          );
        },
      ),
    );
  }

  void _onOptionSelected(String option) {
    setState(() {
      if (_selectedOptions.contains(option)) {
        _selectedOptions.remove(option);
      } else {
        _selectedOptions.add(option);
      }
    });
  }
}
