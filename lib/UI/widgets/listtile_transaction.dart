import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/avatar_polygone.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TransactionWallet extends StatefulWidget {
  final String transactionAmount, transactionInfo, player, date;
  final String? profilePicture;

  const TransactionWallet(
      {Key? key,
      this.profilePicture,
      required this.transactionAmount,
      required this.transactionInfo,
      required this.player,
      required this.date})
      : super(key: key);

  @override
  State<TransactionWallet> createState() => _TransactionState();
}

class _TransactionState extends State<TransactionWallet> {
  bool _isPaid = false;

  void _transactionStatus() {
    setState(() {
      _isPaid = !_isPaid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        dismissible: DismissiblePane(onDismissed: () {}),
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: GestureDetector(
        onLongPress: _transactionStatus,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget.date),
            Container(
              height: size.height * 0.1,
              margin: const EdgeInsets.all(9.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Stack(
                      children: <Widget>[
                        AvatarPolygone(
                          profilePicture: widget.profilePicture,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0.5,
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: const FittedBox(
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Flexible(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              widget.player,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 234, 234, 234),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              " ${widget.transactionAmount}€",
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              widget.transactionInfo,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              _isPaid ? 'Paid' : 'Unpaid',
                              style: TextStyle(
                                fontSize: 13,
                                color: _isPaid ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
