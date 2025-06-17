import 'package:flutter/material.dart';
import 'package:lol_app/presentation/widgets/custom_button.dart';
import 'package:lol_app/presentation/widgets/tween_aniamtion.dart';

import 'field_bottom_content.dart';

class SearchChampionContent extends StatelessWidget {
  const SearchChampionContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationWidget(
      direction: AnimationDirection.top,
      duration: const Duration(milliseconds: 450),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth =
              constraints.maxWidth > 600 ? 600 : double.infinity;

          return Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Container(
                height: 120,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const FieldBottomSheetContent(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ButtonButtomWidget(
                        icon: const Icon(Icons.search),
                        height: 52,
                        decorated: false,
                        onTap: () {
                          // search code here
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
