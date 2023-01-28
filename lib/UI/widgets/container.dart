import 'package:flutter/material.dart';

class ContainerTest extends StatelessWidget {
  const ContainerTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Center(
        child: Container(
            height: 50,
            width: 357,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Row(
              children: [
                const Icon(Icons.account_circle),
                Text(
                  'Tom Ottelé',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            )),
      ),
    );
  }
}
