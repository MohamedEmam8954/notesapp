import 'package:flutter/material.dart';

class CustomButtomAppBar extends StatelessWidget {
  const CustomButtomAppBar(
      {super.key, required this.icons, required this.ontap});
  final IconData icons;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 39,
        height: 39,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.09),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icons),
      ),
    );
  }
}
