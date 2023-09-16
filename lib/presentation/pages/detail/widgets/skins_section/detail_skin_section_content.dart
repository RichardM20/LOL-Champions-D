import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'carousel_skin_content.dart';
import 'carousel_skin_top_content.dart';
import 'dots_content.dart';

class DetailSkinSection extends StatefulWidget {
  const DetailSkinSection({
    super.key,
  });

  @override
  State<DetailSkinSection> createState() => _DetailSkinSectionState();
}

class _DetailSkinSectionState extends State<DetailSkinSection> {
  final pageController = PageController(initialPage: 0);
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkinCarouselTopContent(
          pageController: pageController,
        ),
        SizedBox(height: 20.h),
        CarouselSkinContent(
          pageController: pageController,
        ),
        const SizedBox(
          height: 10,
        ),
        const DotsCarouselSkinContent(),
      ],
    );
  }
}
