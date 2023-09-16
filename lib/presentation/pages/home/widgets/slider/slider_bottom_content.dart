import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'slider_button_content.dart';
import 'slider_info_text_content.dart';

class SliderBottomContent extends StatelessWidget {
  const SliderBottomContent({
    super.key,
    required this.championName,
    required this.championType,
    required this.championId,
  });
  final String championId;
  final String championName;
  final String championType;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 38.h, horizontal: 15.w),
          color: Colors.white,
          width: double.infinity,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SliderButtonContent(
            championName: championId,
          ),
        ),
        Positioned(
          top: 22,
          left: 20,
          child: SliderTextBottomInfo(
            championNamel: championName,
            championType: championType,
          ),
        ),
      ],
    );
  }
}
