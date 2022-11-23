import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polla_futbolera/ui/themes/main_theme.dart';

class CustomButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? width;
  final double? borderRadius;
  final double buttonElevation;
  final double internalHorizontalPadding;
  final double internalVerticalPadding;
  const CustomButton(
      {Key? key,
      this.icon,
      required this.text,
      required this.onPressed,
      this.width,
      this.fontSize = 16,
      this.fontColor = Colors.white,
      this.fontWeight = FontWeight.w600,
      this.backgroundColor = MainTheme.primaryColor,
      this.borderRadius = 26,
      this.borderColor = MainTheme.primaryColor,
      this.buttonElevation = 0,
      this.internalHorizontalPadding = 16,
      this.internalVerticalPadding = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 6),
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      side: BorderSide(color: borderColor!))),
              elevation: MaterialStateProperty.all(buttonElevation)),
          onPressed: onPressed,
          child: (icon == null)
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: internalVerticalPadding,
                      horizontal: internalHorizontalPadding),
                  child: Text(text,
                      style: GoogleFonts.nunito(
                          fontSize: fontSize!,
                          color: fontColor!,
                          fontWeight: fontWeight!)),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: internalVerticalPadding,
                      horizontal: internalHorizontalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: fontColor,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        text,
                        style: GoogleFonts.nunito(
                            fontSize: fontSize!,
                            color: fontColor!,
                            fontWeight: fontWeight!),
                      ),
                    ],
                  ),
                )),
    );
  }
}
