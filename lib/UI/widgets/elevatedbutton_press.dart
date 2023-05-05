import 'package:flutter/material.dart';

class AvailabilityButton extends StatefulWidget {
  const AvailabilityButton({super.key});

  @override
  _AvailabilityButtonState createState() => _AvailabilityButtonState();
}

class _AvailabilityButtonState extends State<AvailabilityButton> {
  int _index = 0;
  final List<String> _statuses = [
    'Availability?',
    'Absent',
    'Present',
    'Late',
  ];
  final List<Color> _colors = [
    Colors.grey,
    Colors.red,
    Colors.green,
    Colors.orange,
  ];
  bool _isAvailabilityRemoved = false;

  void _onPressed() {
    setState(() {
      if (!_isAvailabilityRemoved) {
        _statuses.removeAt(0);
        _colors.removeAt(0);
        _isAvailabilityRemoved = true;
      }
      _index = (_index + 1) % _statuses.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.05,
      width: size.width * 0.7,
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _colors[_index],
        ),
        child: Text(_statuses[_index]),
      ),
    );
  }
}
