import 'package:flutter/material.dart';
import 'package:sahabatmt/app/constants/constants.dart';

class Input extends StatelessWidget {
  final String? placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final Color? borderColor;

  Input(
      {this.placeholder,
        this.suffixIcon,
        this.prefixIcon,
        this.onTap,
        this.onChanged,
        this.autofocus = false,
        this.borderColor = kSecondaryColor,
        this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: kSubtitleTextColor,
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        autofocus: autofocus,
        style:
        TextStyle(height: 0.85, fontSize: 14.0, color: kPrimaryColor),
        textAlignVertical: TextAlignVertical(y: 0.6),
        decoration: InputDecoration(
            filled: true,
            fillColor: kBackgroundColor1,
            hintStyle: TextStyle(
              color: kSubtitleTextColor,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                    color: kSubtitleTextColor, width: 1.0, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                    color: kSubtitleTextColor, width: 1.0, style: BorderStyle.solid)),
            hintText: placeholder));
  }
}
