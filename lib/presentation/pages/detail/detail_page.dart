import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';
import 'package:lol_app/presentation/blocs/detail/detail_state.dart';
import 'package:lol_app/presentation/widgets/loading_widget.dart';

import 'widgets/detail_page_content.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final DetailPageCubit cubit;
  late final String id;

  @override
  void initState() {
    super.initState();

    final queryParams =
        GoRouter.of(context).routeInformationProvider.value.uri.queryParameters;

    id = queryParams['id'] ?? '';
    cubit = GetIt.instance<DetailPageCubit>();

    if (id.isNotEmpty) {
      cubit.getDetailChampion(championName: '$id.json');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<DetailPageCubit, DetailState>(
        builder: (context, state) {
          if (state.requestState == ChampionDetailState.initial ||
              state.requestState == ChampionDetailState.loading) {
            return const LoadingWidget();
          }

          if (state.requestState == ChampionDetailState.error &&
              state.errorMessage != null) {
            return ErrorWidget(state.errorMessage!);
          }

          return const DetailPageContent();
        },
      ),
    );
  }
}
