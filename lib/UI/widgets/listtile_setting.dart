import 'package:flutter/material.dart';

class ListTileSetting extends StatefulWidget {
  final String title;
  final String trailing;
  final int? maxLines;
  final double? topRight;
  final double? topLeft;
  final double? bottomLeft;
  final double? bottomRight;

  const ListTileSetting(
      {super.key,
      required this.title,
      required this.trailing,
      this.maxLines,
      this.topLeft,
      this.topRight,
      this.bottomLeft,
      this.bottomRight});

  @override
  State<ListTileSetting> createState() => _ListTileSettingState();
}

class _ListTileSettingState extends State<ListTileSetting> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.topLeft ?? 15),
              topRight: Radius.circular(widget.topRight ?? 15),
              bottomLeft: Radius.circular(widget.bottomLeft ?? 15),
              bottomRight: Radius.circular(widget.bottomRight ?? 15))),
      tileColor: Theme.of(context).colorScheme.onPrimary,
      title: Text(
        widget.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: Text(
        widget.trailing,
        overflow: TextOverflow.ellipsis,
        maxLines: widget.maxLines ?? 1,
      ),
    );
  }
}
