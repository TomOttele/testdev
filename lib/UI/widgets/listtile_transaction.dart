import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/avatar_polygone.dart';

enum TransactionType { paid, unpaid }

class Transaction extends StatelessWidget {
  final TransactionType transactionType;
  final String transactionAmout, transactionInfo, receptient;
  const Transaction(
      {Key? key,
      required this.transactionType,
      required this.transactionAmout,
      required this.transactionInfo,
      required this.receptient})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    String transactionName;
    IconData transactionIconData;
    Color color;
    switch (transactionType) {
      case TransactionType.paid:
        transactionName = "Paid";
        transactionIconData = Icons.arrow_upward;
        color = Colors.green;
        break;
      case TransactionType.unpaid:
        transactionName = "Unpaid";
        transactionIconData = Icons.arrow_downward;
        color = Colors.red;
        break;
    }
    return Container(
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
                const AvatarPolygone(),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      receptient,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 234, 234, 234),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      " $transactionAmout€",
                      style: const TextStyle(
                          fontSize: 20,
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
                      transactionInfo,
                      style: const TextStyle(),
                    ),
                    Text(
                      transactionName,
                      style: TextStyle(
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
    );
  }
}
