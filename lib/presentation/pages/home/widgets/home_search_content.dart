import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:lol_app/presentation/widgets/custom_button.dart';

import 'field_bottom_content.dart';

class SearchChampionContent extends StatelessWidget {
  const SearchChampionContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: const Duration(milliseconds: 450),
      builder: (context, value, child) => Transform.translate(
        offset: Offset(0.0, -300 * value),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Container(
            height: 120,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Stack(
              children: [
                const FieldBottomSheetContent(),
                Positioned(
                  right: 1,
                  top: 6.h,
                  child: ButtonButtomWidget(
                    icon: const Icon(Icons.search),
                    height: 45,
                    decorated: false,
                    onTap: () {
                      //sarch code here
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
