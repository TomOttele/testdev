import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/separator.dart';

class BirthdayInputWidget extends StatefulWidget {
  const BirthdayInputWidget({Key? key}) : super(key: key);

  @override
  _BirthdayInputWidgetState createState() => _BirthdayInputWidgetState();
}

class _BirthdayInputWidgetState extends State<BirthdayInputWidget> {
  final _dayController = TextEditingController();
  final _monthController = TextEditingController();
  final _yearController = TextEditingController();
  int? _day;
  int? _month;
  int? _year;
  String? _errorMessage;

  @override
  void dispose() {
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
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
            Container(
              width: size.width * 0.16,
              height: size.height * 0.091,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 3, left: 2),
                child: Column(children: [
                  const Center(child: Text('Day')),
                  Center(
                    child: TextField(
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
                          _day = null;
                        } else {
                          final day = int.tryParse(value);
                          if (day != null && day >= 1 && day <= 31) {
                            _day = day;
                            _errorMessage = null;
                            void _focusNextField(
                                FocusNode currentFocus, FocusNode nextFocus) {
                              currentFocus.unfocus();
                              FocusScope.of(context).requestFocus(nextFocus);
                            }
                          } else {
                            _day = null;
                            _errorMessage = 'Invalid';
                          }
                        }
                        _updateBirthday();
                        setState(() {});
                      },
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              width: size.width * 0.16,
              height: size.height * 0.091,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 3, left: 2),
                child: Column(children: [
                  Center(child: Text('Month')),
                  TextField(
                    maxLength: 2,
                    controller: _monthController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      hintText: 'mm',
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        _month = null;
                      } else {
                        final month = int.tryParse(value);
                        if (month != null && month >= 1 && month <= 12) {
                          _month = month;
                          _errorMessage = null;
                          void _focusNextField(
                              FocusNode currentFocus, FocusNode nextFocus) {
                            currentFocus.unfocus();
                            FocusScope.of(context).requestFocus(nextFocus);
                          }

                          ;
                        } else {
                          _month = null;
                          _errorMessage = 'Invalid';
                        }
                      }
                      _updateBirthday();
                      setState(() {});
                    },
                  ),
                ]),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              width: size.width * 0.16,
              height: size.height * 0.091,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 3, left: 2),
                child: Column(
                  children: [
                    Center(child: Text('Year')),
                    TextField(
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
                          _year = null;
                        } else {
                          final year = int.tryParse(value);
                          if (year != null && year >= 1950 && year <= 2022) {
                            _year = year;
                            _errorMessage = null;
                          } else {
                            _year = null;
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

  void _updateBirthday() {
    final birthday = _day != null && _month != null && _year != null
        ? DateTime(_year!, _month!, _day!)
        : null;
    // TODO: Do something with the birthday
  }
}
