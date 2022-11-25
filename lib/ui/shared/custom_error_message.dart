import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomErrorMessage extends StatelessWidget {
  final String textMessage;
  const CustomErrorMessage({super.key, required this.textMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(22)),
      child: Text(
        textMessage,
        textAlign: TextAlign.justify,
        style: GoogleFonts.nunito(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
    ));
  }
}
