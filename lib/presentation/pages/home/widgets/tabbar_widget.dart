import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/colors_app.dart';
import 'package:lol_app/app/utils/font_app.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key, required this.tabs});
  final List tabs;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      physics: const BouncingScrollPhysics(),
      indicatorColor: Colors.amber,
      labelColor: ColorsApp.secondaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: Colors.white,
      unselectedLabelStyle: TextStyle(
        fontSize: 15.spMin,
        fontFamily: FontFamilyApp.medium,
      ),
      labelStyle: TextStyle(
        fontSize: 15.spMin,
        fontFamily: FontFamilyApp.medium,
      ),
      tabs: List.generate(
        tabs.length,
        (index) => Tab(
          text: tabs[index],
        ),
      ),
    );
  }
}
