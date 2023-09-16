import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:lol_app/app/utils/colors_app.dart';
import 'package:lol_app/app/utils/font_app.dart';
import 'package:lol_app/app/utils/rol_filter.dart';
import 'package:lol_app/presentation/blocs/riot/riot_cubit.dart';
import 'package:lol_app/presentation/blocs/riot/riot_data_state.dart';
import 'package:lol_app/presentation/widgets/custom_button.dart';
import 'package:lol_app/presentation/widgets/loading_widget.dart';

import 'home_search_content.dart';
import 'icon_appbar_content.dart';
import 'slider/slider_content.dart';
import 'tabbar_widget.dart';
import 'title_content.dart';

// ignore: must_be_immutable
class HomePageContent extends StatelessWidget {
  List tabs = ['All', 'Top Lane', 'Mid Lane', 'Bot Lane', 'Jungle'];

  HomePageContent({super.key});
  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const IconAppbarContent(),
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 200.h),
            child: Column(
              children: [
                const TitleTabbarContent(),
                const SearchChampionContent(),
                TabBarWidget(tabs: tabs),
              ],
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: 250.h),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/ashe-v.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -250.h,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 100,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                return TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SliderContent(
                      championList: state.filterListChampios!.isEmpty
                          ? []
                          : state.filterListChampios!,
                    ),
                    SliderContent(
                      championList: state.filterListChampios!.isEmpty
                          ? []
                          : homeCubit.filterChampions(topLane),
                    ),
                    SliderContent(
                      championList: state.filterListChampios!.isEmpty
                          ? []
                          : homeCubit.filterChampions(miLane),
                    ),
                    SliderContent(
                      championList: state.filterListChampios!.isEmpty
                          ? []
                          : homeCubit.filterChampions(botLane),
                    ),
                    SliderContent(
                      championList: state.filterListChampios!.isEmpty
                          ? []
                          : homeCubit.filterChampions(jungle),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
