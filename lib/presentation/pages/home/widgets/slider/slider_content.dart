import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lol_app/app/utils/font_app.dart';
import 'package:lol_app/domain/models/champions_data_model.dart';

import 'package:lol_app/presentation/pages/home/widgets/slider/slider_image_content.dart';

import 'slider_bottom_content.dart';

// ignore: must_be_immutable
class SliderContent extends StatefulWidget {
  const SliderContent({super.key, required this.championList});
  final List<ChampionData> championList;

  @override
  State<SliderContent> createState() => _SliderContentState();
}

class _SliderContentState extends State<SliderContent> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: const Duration(milliseconds: 450),
      builder: (context, value, child) => Transform.translate(
          offset: Offset(0.0, 200 * value),
          child: widget.championList.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
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
                    )
                  ],
                )
              : PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.championList.length,
                  onPageChanged: (val) {
                    setState(() {
                      selectedIndex = val;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final champion = widget.championList[index];
                    final scale = selectedIndex == index ? 1.0 : 0.8;
                    return TweenAnimationBuilder(
                      curve: Curves.decelerate,
                      duration: const Duration(milliseconds: 250),
                      tween: Tween(begin: scale, end: scale),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          left: 30.w,
                          right: 30.w,
                        ),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SliderTopImageContent(
                                        championId: champion.id!),
                                    SliderBottomContent(
                                      championId: champion.id!,
                                      championName: champion.name ?? "",
                                      championType: champion.tags!.toString(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: scale,
                          child: child,
                        );
                      },
                    );
                  },
                )),
    );
  }
}
