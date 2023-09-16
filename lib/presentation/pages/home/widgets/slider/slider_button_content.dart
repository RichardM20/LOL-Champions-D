import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:lol_app/app/utils/music.dart';

import 'package:lol_app/presentation/widgets/custom_button.dart';

class SliderButtonContent extends StatelessWidget {
  const SliderButtonContent({
    super.key,
    required this.championName,
  });
  final String championName;
  @override
  Widget build(BuildContext context) {
    return ButtonButtomWidget(
      onTap: () {
        Music.touchButton();
        GoRouter.of(context).pushNamed('/detail-page', queryParameters: {
          "id": championName,
        });
      },
    );
  }
}
