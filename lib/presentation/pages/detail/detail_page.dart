import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';
import 'package:lol_app/presentation/blocs/detail/detail_state.dart';

import 'package:lol_app/presentation/widgets/loading_widget.dart';

import 'widgets/detail_page_content.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DetailPageCubit cubit;
  late String id;
  @override
  void initState() {
    id = GoRouter.of(context)
        .routeInformationProvider
        .value
        .uri
        .queryParameters['id']
        .toString();
    cubit = GetIt.instance<DetailPageCubit>();
    cubit.getDetailChampion(championName: "$id.json");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<DetailPageCubit, DetailState>(
        builder: (context, state) {
          if (state.requestState == ChampionDetailState.initial ||
              state.requestState == ChampionDetailState.loading) {
            return const LoadingWidget();
          } else if (state.errorMessage != null &&
              state.requestState == ChampionDetailState.error) {
            return ErrorWidget(state.errorMessage ?? "");
          }
          return const DetailPageContent();
        },
      ),
    );
  }
}
