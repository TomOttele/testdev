import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TelephoneNumber extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final int maxLenght;
  final double? width;

  const TelephoneNumber(
      {Key? key,
      this.hintText,
      required this.labelText,
      required this.maxLenght,
      this.width})
      : super(key: key);

  @override
  State<TelephoneNumber> createState() => _TelephoneNumber();
}

class _TelephoneNumber extends State<TelephoneNumber> {
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: size.height * 0.093,
          width: widget.width ?? size.width * 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
          ),
          child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: widget.maxLenght,
              decoration: InputDecoration(
                border: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: widget.hintText,
                filled: true,
                fillColor: Theme.of(context).colorScheme.onPrimary,
                labelText: widget.labelText,
                counterText: '',
                labelStyle: const TextStyle(color: Colors.grey),
                prefixIcon: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final code = await countryPicker.showPicker(
                                context: context);
                            setState(() {
                              countryCode = code;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                child: countryCode != null
                                    ? countryCode!.flagImage as Widget
                                    : null,
                              ),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Text('+1',
                                      style: TextStyle(color: Colors.white))),
                            ],
                          ),
                        )
                      ],
                    )),
              )),
        ),
      ],
    );
  }
}
