import 'package:flutter/material.dart';
import 'package:lol_app/app/utils/font_app.dart';

class SliderEmptyState extends StatelessWidget {
  const SliderEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Data not found",
              style: TextStyle(
                fontFamily: FontFamilyApp.bold,
              ),
            ),
            const TextSpan(
              text: " ):",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
