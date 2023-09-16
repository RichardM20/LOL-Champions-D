import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/font_app.dart';

class SliderTextBottomInfo extends StatelessWidget {
  const SliderTextBottomInfo({
    super.key,
    required this.championNamel,
    required this.championType,
  });
  final String championNamel;
  final String championType;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$championNamel\n',
            style: TextStyle(
              fontFamily: FontFamilyApp.bold,
              fontSize: 20.spMin,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: championType
                .replaceAll("Tag.", "")
                .replaceAll("]", "")
                .replaceAll("[", "")
                .replaceAll(",", " -"),
            style: TextStyle(
              height: 1.5,
              fontFamily: FontFamilyApp.medium,
              fontSize: 15.spMin,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
