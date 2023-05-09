import 'package:flutter/material.dart';

class BirthdayInputWidget extends StatefulWidget {
  const BirthdayInputWidget({Key? key}) : super(key: key);

  @override
  _BirthdayInputWidgetState createState() => _BirthdayInputWidgetState();
}

class _BirthdayInputWidgetState extends State<BirthdayInputWidget> {
  final _dayController = TextEditingController();
  final _monthController = TextEditingController();
  final _yearController = TextEditingController();
  String? _errorMessage;

  late FocusNode _dayFocusNode; // add this line
  late FocusNode _monthFocusNode; // add this line
  late FocusNode _yearFocusNode; // add this line

  @override
  void initState() {
    super.initState();
    _dayFocusNode = FocusNode(); // add this line
    _monthFocusNode = FocusNode(); // add this line
    _yearFocusNode = FocusNode(); // add this line
  }

  @override
  void dispose() {
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    _dayFocusNode.dispose(); // add this line
    _monthFocusNode.dispose(); // add this line
    _yearFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: size.width * 0.16,
                height: size.height * 0.092,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Column(children: [
                    const Center(child: Text('Day')),
                    Center(
                      child: TextField(
                        textAlign: TextAlign.center,
                        maxLength: 2,
                        controller: _dayController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: '',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          hintText: 'dd',
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                          } else {
                            final day = int.tryParse(value);
                            if (day != null && day >= 1 && day <= 31) {
                              _errorMessage = null;
                            } else {
                              _errorMessage = 'Invalid';
                            }
                          }
                          _updateBirthday();
                          setState(() {});
                        },
                        onSubmitted: (_) {
                          // Move focus to second text field
                          FocusScope.of(context).requestFocus(_monthFocusNode);
                        },
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(width: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: size.width * 0.16,
                height: size.height * 0.092,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(children: [
                    const Center(child: Text('Month')),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                        child: TextField(
                          focusNode: _monthFocusNode,
                          textAlign: TextAlign.center,
                          maxLength: 2,
                          controller: _monthController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            counterText: '',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            filled: true,
                            fillColor: Colors.blue,
                            hintText: 'mm',
                          ),
                          onChanged: (value) {
                            if (value.isEmpty) {
                            } else {
                              final month = int.tryParse(value);
                              if (month != null && month >= 1 && month <= 12) {
                                _errorMessage = null;
                              } else {
                                _errorMessage = 'Invalid';
                              }
                            }
                            _updateBirthday();
                            setState(() {});
                          },
                          onSubmitted: (_) {
                            // Move focus to third text field
                            FocusScope.of(context).requestFocus(_yearFocusNode);
                          },
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(width: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: size.width * 0.2,
                height: size.height * 0.092,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      const Center(child: Text('Year')),
                      TextField(
                        focusNode: _yearFocusNode,
                        textAlign: TextAlign.center,
                        maxLength: 4,
                        controller: _yearController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: '',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          hintText: 'yyyy',
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                          } else {
                            final year = int.tryParse(value);
                            if (year != null && year >= 1950 && year <= 2022) {
                              _errorMessage = null;
                            } else {
                              _errorMessage = 'Invalid ';
                            }
                          }
                          _updateBirthday();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        if (_errorMessage != null)
          Text(
            _errorMessage!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 12,
            ),
          ),
      ],
    );
  }

  void _updateBirthday() {}
}
