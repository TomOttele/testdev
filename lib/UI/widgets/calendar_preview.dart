import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/dropdown_button.dart';
import 'package:testdev/UI/widgets/separator.dart';

class CalendarPreview extends StatefulWidget {
  final String day;
  final String time;

  const CalendarPreview({super.key, required this.day, required this.time});

  @override
  State<CalendarPreview> createState() => _CalendarPreviewState();
}

class _CalendarPreviewState extends State<CalendarPreview> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(15)),
      height: size.height * 0.2,
      width: size.width * 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.day,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.time,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Training',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const Separator(),
                  DropDownMenu(
                    items: const ['Present', 'Late', 'Absent'],
                    labelText: 'Availability',
                    width: size.width * 0.4,
                    color: Colors.grey,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
