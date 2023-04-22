/*import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/separator.dart';

class SwipeToDeleteListView extends StatefulWidget {
  final List<String> itemsTrailing;
  final List<String> itemsTitle;

  final int? maxLines;
  final double? topRight;
  final double? topLeft;
  final double? bottomLeft;
  final double? bottomRight;

  const SwipeToDeleteListView(
      {Key? key,
      required this.itemsTrailing,
      required this.itemsTitle,
      this.maxLines,
      this.topLeft,
      this.topRight,
      this.bottomLeft,
      this.bottomRight})
      : super(key: key);

  @override
  _SwipeToDeleteListViewState createState() => _SwipeToDeleteListViewState();
}

class _SwipeToDeleteListViewState extends State<SwipeToDeleteListView> {
  late List<String> _itemsTrailing;
  late List<String> _itemsTitle;

  @override
  void initState() {
    super.initState();
    _itemsTrailing = List<String>.from(widget.itemsTrailing);
    _itemsTitle = List<String>.from(
        widget.itemsTitle); // Create a new List from the UnmodifiableListView
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const Separator(),
      itemCount: _itemsTrailing.length,
      itemBuilder: (BuildContext context, int index) {
        final itemTrailing = _itemsTrailing[index];
        final itemTitle = _itemsTitle[index];
        return Dismissible(
            key: Key(itemTrailing),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.delete),
            ),
            onDismissed: (direction) {
              setState(() {
                _itemsTrailing.removeAt(index);
                _itemsTitle.removeAt(index);
              });
            },
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.topLeft ?? 15),
                      topRight: Radius.circular(widget.topRight ?? 15),
                      bottomLeft: Radius.circular(widget.bottomLeft ?? 15),
                      bottomRight: Radius.circular(widget.bottomRight ?? 15))),
              tileColor: Theme.of(context).colorScheme.onPrimary,
              title: Text(
                itemTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              trailing: Text(
                itemTrailing,
                overflow: TextOverflow.ellipsis,
                maxLines: widget.maxLines ?? 1,
              ),
            ));
      },
    );
  }
}*/
