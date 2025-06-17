import 'package:flutter/widgets.dart';

enum AnimationDirection { top, bottom, left, right }

class TweenAnimationWidget extends StatelessWidget {
  const TweenAnimationWidget({
    super.key,
    required this.child,
    required this.direction,
    this.duration = const Duration(milliseconds: 600),
    this.beginOffset = 50.0,
  });

  final Widget child;
  final AnimationDirection direction;
  final Duration duration;
  final double beginOffset;

  Offset _getOffset(double value) {
    switch (direction) {
      case AnimationDirection.top:
        return Offset(0.0, -beginOffset * value);
      case AnimationDirection.bottom:
        return Offset(0.0, beginOffset * value);
      case AnimationDirection.left:
        return Offset(-beginOffset * value, 0.0);
      case AnimationDirection.right:
        return Offset(beginOffset * value, 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: duration,
      builder: (context, value, _) => Transform.translate(
        offset: _getOffset(value),
        child: child,
      ),
    );
  }
}
