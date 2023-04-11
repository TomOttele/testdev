import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'xexperiment2.dart';

class MyListTile extends StatefulWidget {
  @override
  _MyListTileState createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  bool _showBottomSheet = false;
  List<String> _selectedOptions = [];

  void _toggleBottomSheet() {
    setState(() {
      _showBottomSheet = !_showBottomSheet;
    });
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

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('My List Tile'),
      trailing: Icon(Icons.arrow_drop_down),
      onTap: _toggleBottomSheet,
      subtitle: Wrap(
        spacing: 8.0,
        children: _selectedOptions.map((option) {
          return Chip(
            label: Text(option),
            onDeleted: () {
              _onOptionSelected(option);
            },
          );
        }).toList(),
      ),
      isThreeLine: true,
    );
  }
}
