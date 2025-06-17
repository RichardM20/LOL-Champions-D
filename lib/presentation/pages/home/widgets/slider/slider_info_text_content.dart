import 'package:flutter/material.dart';
import 'package:lol_app/app/utils/font_app.dart';

class SliderTextBottomInfo extends StatelessWidget {
  const SliderTextBottomInfo({
    super.key,
    required this.championName,
    required this.championType,
  });

  final String championName;
  final String championType;

  @override
  Widget build(BuildContext context) {
    final formattedType = _formatChampionType(championType);

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$championName\n',
            style: TextStyle(
              fontFamily: FontFamilyApp.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: formattedType,
            style: TextStyle(
              height: 1.5,
              fontFamily: FontFamilyApp.medium,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  String _formatChampionType(String raw) {
    final regex = RegExp(r'Tag\.([\w]+)');
    final matches = regex.allMatches(raw);

    if (matches.isNotEmpty) {
      return matches.map((m) => m.group(1)).join(' - ');
    }

    return raw.replaceAll(RegExp(r'[\[\]]'), '').replaceAll(',', ' - ').trim();
  }
}
