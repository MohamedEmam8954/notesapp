import 'package:flutter/material.dart';
import 'package:realsenotesapp/widgets/custombottomappbar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.icon,
      required this.ontap});
  final String title;
  final IconData icon;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 32),
        ),
        CustomButtomAppBar(
          icons: icon,
          ontap: ontap,
        )
      ],
    );
  }
}
