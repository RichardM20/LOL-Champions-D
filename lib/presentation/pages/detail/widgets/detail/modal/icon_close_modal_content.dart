import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IconCloseModalAbilities extends StatelessWidget {
  const IconCloseModalAbilities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 5,
      child: GestureDetector(
        onTap: () => GoRouter.of(context).pop(),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white.withValues(
                alpha: 0.06,
              ),
            ),
            child: const Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
          ),
        ),
      ),
    );
  }
}
