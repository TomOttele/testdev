import 'package:flutter/material.dart';
import 'dart:io';

class AvatarRoundA extends StatefulWidget {
  final Future<Object?> Function() onTap;

  const AvatarRoundA({Key? key, required this.onTap}) : super(key: key);

  @override
  State<AvatarRoundA> createState() => _AvatarRoundAState();
}

class _AvatarRoundAState extends State<AvatarRoundA> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 25,
      backgroundImage: image != null
          ? FileImage(image!) as ImageProvider
          : const AssetImage('assets/images/cristiano_ronaldo.webp'),
      child: InkWell(
        onTap: widget.onTap,
      ),
    );
  }
}
