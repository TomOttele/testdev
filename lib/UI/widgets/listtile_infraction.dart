import 'package:flutter/material.dart';

class Infraction extends StatelessWidget {
  final String infractionName, infractionAmount;

  const Infraction(
      {Key? key, required this.infractionName, required this.infractionAmount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.07,
      margin: const EdgeInsets.all(9.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            infractionName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text('$infractionAmount€')
        ],
      ),
    );
  }
}
