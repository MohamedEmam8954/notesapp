import 'package:flutter/material.dart';
import 'package:realsenotesapp/widgets/constant.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.onchanged,
      required this.hintext,
      this.maxline = 1});
  final void Function(String)? onchanged;
  final String hintext;
  final int maxline;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "this field is required";
        }
        return null;
      },
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onChanged: onchanged,
      maxLines: maxline,
      decoration: InputDecoration(
        hintText: hintext,
        hintStyle: const TextStyle(color: kprimarycolor, fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.6),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: kprimarycolor,
          ),
        ),
      ),
    );
  }
}
