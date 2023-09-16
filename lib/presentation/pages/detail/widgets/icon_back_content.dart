import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IconBackContent extends StatelessWidget {
  const IconBackContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      left: 15,
      child: TweenAnimationBuilder(
        tween: Tween(begin: 1.0, end: 0.0),
        duration: const Duration(milliseconds: 600),
        builder: (context, value, child) => Transform.translate(
          offset: Offset(0.0, -50 * value),
          child: GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black.withOpacity(
                  0.5,
                ),
              ),
              child: Transform.translate(
                offset: const Offset(5, 0.0),
                child: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
