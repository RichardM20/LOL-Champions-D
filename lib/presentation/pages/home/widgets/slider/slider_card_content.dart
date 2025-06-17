
import 'package:flutter/widgets.dart';
import 'package:lol_app/domain/models/breakpoint.dart';
import 'package:lol_app/domain/models/champions_data_model.dart';
import 'package:lol_app/presentation/pages/home/widgets/slider/slider_bottom_content.dart';
import 'package:lol_app/presentation/pages/home/widgets/slider/slider_image_content.dart';

class SliderCard extends StatelessWidget {
  final ChampionData champion;
  final double scale;
  final BreakpointConfig config;

  const SliderCard({super.key, 
    required this.champion,
    required this.scale,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 250),
      tween: Tween(begin: scale, end: scale),
      builder: (context, animatedScale, _) {
        return Transform.scale(
          scale: animatedScale,
          child: Center(
            child: Container(
              width: config.cardWidth,
              height: 450,
              margin: EdgeInsets.symmetric(horizontal: config.margin),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: SliderTopImageContent(
                      championId: champion.id!,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SliderBottomContent(
                      championId: champion.id!,
                      championName: champion.name ?? "",
                      championType: champion.tags!.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
