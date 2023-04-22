import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  final String labelText;
  final List<String> items;
  final dynamic? color;
  final double? width;

  const DropDownMenu(
      {Key? key,
      required this.items,
      required this.labelText,
      this.width,
      this.color})
      : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    String? selectedItem;
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.073,
      width: widget.width ?? size.width * 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: widget.color ?? Theme.of(context).colorScheme.onPrimary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: DropdownButtonFormField<String>(
          elevation: 0,
          icon: const Icon(Icons.keyboard_arrow_down),
          isExpanded: true,
          alignment: AlignmentDirectional.centerStart,
          decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
          items: widget.items
              .map((item) => DropdownMenuItem<String>(
                    alignment: Alignment.centerLeft,
                    value: item,
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ))
              .toList(),
          onChanged: (item) => setState(
            () => selectedItem = item,
          ),
        ),
      ),
    );
  }
}
