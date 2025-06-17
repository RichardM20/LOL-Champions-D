import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lol_app/presentation/blocs/riot/riot_cubit.dart';
import 'package:lol_app/presentation/blocs/riot/riot_data_state.dart';
import 'package:lol_app/presentation/pages/home/widgets/home_page_content.dart';
import 'package:lol_app/presentation/widgets/loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late HomeCubit cubit;
  @override
  void initState() {
    cubit = GetIt.instance<HomeCubit>();
    cubit.getAllChampionsData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.requestState == ChampionsRequestState.loading ||
              state.requestState == ChampionsRequestState.initial) {
            return const LoadingWidget();
          } else if (state.requestState == ChampionsRequestState.error) {
            return ErrorWidget(state.errorMessage ?? "");
          }
          return HomePageContent();
        },
      ),
    );
  }
}
