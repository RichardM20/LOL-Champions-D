import 'package:flutter/material.dart';

class ForergroundBlackContent extends StatelessWidget {
  const ForergroundBlackContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black,
          ],
          stops: [
            0.0,
            1.0,
          ],
        ),
      ),
      height: 250,
    );
  }
}
