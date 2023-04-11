import 'package:flutter/material.dart';
import 'dart:io';

class AvatarRoundR extends StatefulWidget {
  final Set<Future<Object?>> Function() onTap;

  const AvatarRoundR({Key? key, required this.onTap}) : super(key: key);

  @override
  State<AvatarRoundR> createState() => _AvatarRoundRState();
}

class _AvatarRoundRState extends State<AvatarRoundR> {
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
