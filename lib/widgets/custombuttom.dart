import 'package:flutter/material.dart';
import 'package:realsenotesapp/widgets/constant.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.ontap, required this.isloading});
  final VoidCallback ontap;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: kprimarycolor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: !isloading
            ? const Text(
                "ADD",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
