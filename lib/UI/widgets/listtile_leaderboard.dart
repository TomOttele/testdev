import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/avatar_polygone.dart';

class Leaderboard extends StatelessWidget {
  final String totalAmount, player, ranking;
  final String? profilePicture;

  const Leaderboard(
      {Key? key,
      required this.ranking,
      this.profilePicture,
      required this.totalAmount,
      required this.player})
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
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Center(
                child: Text(
              ranking,
              style: const TextStyle(fontSize: 30, color: Colors.grey),
            )),
          ),
          const SizedBox(width: 5.0),
          const Flexible(
              flex: 1,
              child: Center(
                child: AvatarPolygone(),
              )),
          const SizedBox(width: 5.0),
          Flexible(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  player,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text('$totalAmount€')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
