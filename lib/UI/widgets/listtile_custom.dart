import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final String title, trailing;
  const CustomListTile({
    super.key,
    required this.title,
    required this.trailing,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                widget.trailing,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                textWidthBasis: TextWidthBasis.longestLine,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
