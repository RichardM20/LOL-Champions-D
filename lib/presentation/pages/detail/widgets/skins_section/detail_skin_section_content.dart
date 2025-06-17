import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/responsive.dart';

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
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final config = ResponsiveUtils.getConfig(constraints.maxWidth);
        pageController = PageController(viewportFraction: config.viewport);
        return Column(
          children: [
            SkinCarouselTopContent(
              pageController: pageController,
            ),
            SizedBox(height: 20.h),
            CarouselSkinContent(
              pageController: pageController,
              maxWidth: constraints.maxWidth,
            ),
            const SizedBox(
              height: 10,
            ),
            const DotsCarouselSkinContent(),
          ],
        );
      },
    );
  }
}
