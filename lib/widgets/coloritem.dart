import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, this.isactive = false});
  final Color color;
  final bool isactive;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 37,
      backgroundColor: isactive ? Colors.white : color,
      child: CircleAvatar(
        radius: 33,
        backgroundColor: color,
      ),
    );
  }
}
