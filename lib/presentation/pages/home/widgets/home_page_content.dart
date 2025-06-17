import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/rol_filter.dart';
import 'package:lol_app/presentation/blocs/riot/riot_cubit.dart';
import 'package:lol_app/presentation/blocs/riot/riot_data_state.dart';

import 'home_search_content.dart';
import 'icon_appbar_content.dart';
import 'slider/slider_content.dart';
import 'tabbar_widget.dart';
import 'title_content.dart';

// ignore: must_be_immutable
class HomePageContent extends StatelessWidget {
  HomePageContent({super.key});

  final List<String> tabs = [
    'All',
    'Top Lane',
    'Mid Lane',
    'Bot Lane',
    'Jungle'
  ];

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: _HomeAppBar(tabs: tabs),
        body: _HomeBody(tabs: tabs, homeCubit: homeCubit),
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> tabs;

  const _HomeAppBar({required this.tabs});

  @override
  Size get preferredSize => Size(double.infinity, 200.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const IconAppbarContent(),
      backgroundColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Column(
          children: [
            const TitleTabbarContent(),
            const SearchChampionContent(),
            TabBarWidget(tabs: tabs),
          ],
        ),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  final List<String> tabs;
  final HomeCubit homeCubit;

  const _HomeBody({required this.tabs, required this.homeCubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(top: 250),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/ashe-v.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _OverlayBackground(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final champions = state.filterListChampios ?? [];

              return TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SliderContent(
                      championList: champions.isEmpty ? [] : champions),
                  SliderContent(
                      championList: champions.isEmpty
                          ? []
                          : homeCubit.filterChampions(topLane)),
                  SliderContent(
                      championList: champions.isEmpty
                          ? []
                          : homeCubit.filterChampions(miLane)),
                  SliderContent(
                      championList: champions.isEmpty
                          ? []
                          : homeCubit.filterChampions(botLane)),
                  SliderContent(
                      championList: champions.isEmpty
                          ? []
                          : homeCubit.filterChampions(jungle)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _OverlayBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -250.h,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 100,
        width: double.infinity,
        color: Colors.black.withOpacity(0.7),
      ),
    );
  }
}
