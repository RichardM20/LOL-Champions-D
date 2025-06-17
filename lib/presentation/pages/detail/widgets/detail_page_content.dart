import 'package:flutter/material.dart';

import 'detail/detail_abiliti_section_content.dart';
import 'detail/detail_about_section_content.dart';
import 'detail/detail_stadistic_section_content.dart';
import 'detail/detail_top_content.dart';
import 'skins_section/detail_skin_section_content.dart';

class DetailPageContent extends StatefulWidget {
  const DetailPageContent({super.key});

  @override
  State<DetailPageContent> createState() => _DetailPageContentState();
}

class _DetailPageContentState extends State<DetailPageContent> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            DetailTopContent(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailAbilitiContent(),
                  Divider(height: 50),
                  StatisticsChampionContent(),
                  Divider(height: 50),
                  DetailAbountContent(),
                  Divider(height: 50),
                  DetailSkinSection(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
