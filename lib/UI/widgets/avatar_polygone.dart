import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class AvatarPolygone extends StatefulWidget {
  const AvatarPolygone({super.key});

  @override
  State<AvatarPolygone> createState() => _AvatarPolygoneState();
}

class _AvatarPolygoneState extends State<AvatarPolygone> {
  @override
  Widget build(BuildContext context) {
    return ClipPolygon(
      sides: 6,
      borderRadius: 8,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(3.0),
        child: ClipPolygon(
          sides: 6,
          borderRadius: 8,
          child: CircularProfileAvatar(
            radius: 20,
            'https://i.goalzz.com/?i=ashraf-zamrani%2Flionelmessi.gif',
            borderWidth: 1,
          ),
        ),
      ),
    );
  }
}
