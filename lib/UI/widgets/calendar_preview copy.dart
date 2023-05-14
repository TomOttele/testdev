import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/separator.dart';

import 'elevatedbutton_press.dart';

class CalendarPreview2 extends StatefulWidget {
  final String day;
  final String time;

  const CalendarPreview2({super.key, required this.day, required this.time});

  @override
  State<CalendarPreview2> createState() => _CalendarPreview2State();
}

class _CalendarPreview2State extends State<CalendarPreview2> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(15)),
        height: size.height * 0.2,
        width: size.width * 1,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, bottom: 5, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.day,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.time,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Training',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          'Stadium um Bierg',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Separator(),
                        const Separator(),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: const AvailabilityButton())),
            ],
          ),
        ),
      ),
    );
  }
}
