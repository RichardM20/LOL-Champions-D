import 'package:flutter/material.dart';
import 'package:lol_app/app/utils/colors_app.dart';
import 'package:lol_app/app/utils/env.dart';

class ImageAbilitieContent extends StatelessWidget {
  const ImageAbilitieContent({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: ColorsApp.primaryColor,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            "${Environment.skillsApi}${id!}.png",
          ),
        ),
      ),
    );
  }
}
