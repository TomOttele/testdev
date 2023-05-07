import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/avatar_polygone.dart';

enum TransactionStatus { paid, unpaid }

class Transaction extends StatefulWidget {
  final TransactionStatus transactionStatus;
  final String transactionAmount, transactionInfo, player;
  final String? profilePicture;

  const Transaction(
      {Key? key,
      this.profilePicture,
      required this.transactionStatus,
      required this.transactionAmount,
      required this.transactionInfo,
      required this.player})
      : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  late TransactionStatus _transactionStatus;

  @override
  void initState() {
    super.initState();
    _transactionStatus = widget.transactionStatus;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    String transactionStatusName;
    IconData transactionIconData;
    Color color;
    switch (widget.transactionStatus) {
      case TransactionStatus.paid:
        transactionStatusName = "Paid";
        transactionIconData = Icons.arrow_upward;
        color = Colors.green;
        break;
      case TransactionStatus.unpaid:
        transactionStatusName = "Unpaid";
        transactionIconData = Icons.arrow_downward;
        color = Colors.red;
        break;
    }
    return GestureDetector(
      onTap: () {
        setState(
          () {
            if (_transactionStatus == TransactionStatus.paid) {
              _transactionStatus = TransactionStatus.unpaid;
            } else {
              _transactionStatus = TransactionStatus.paid;
            }
          },
        );
      },
      child: Container(
        height: size.height * 0.095,
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
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                      child: FittedBox(
                        child: Icon(
                          transactionIconData,
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
                        transactionStatusName,
                        style: TextStyle(
                          fontSize: 13,
                          color: color,
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
    );
  }
}
