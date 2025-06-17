import 'package:bloc/bloc.dart';
import 'package:lol_app/data/models/data_state.dart';
import 'package:lol_app/domain/models/champions_data_model.dart';
import 'package:lol_app/domain/usecases/riot_api_usecase.dart';

import 'riot_data_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late final RiotApiUsecase _riotApiUsecase;
  HomeCubit(this._riotApiUsecase)
      : super(
          HomeState(
            tags: [],
            requestState: ChampionsRequestState.initial,
            listChampions: [],
            filterListChampios: [],
            errorMessage: '',
          ),
        );

  Future getAllChampionsData() async {
    resetLoading();
    startLoading();
    final response = await _riotApiUsecase.getAllChampionsData();
    if (response is DataSuccess) {
      emit(state.copyWith(
        requestState: ChampionsRequestState.success,
        errorMessage: '',
        filterListChampios: response.data,
        listChampions: response.data,
      ));
    } else {
      emit(
        state.copyWith(
          requestState: ChampionsRequestState.error,
          errorMessage: response.props.first.toString(),
        ),
      );
    }
  }

  List<ChampionData> filterChampions(List<Tag> filters) {
    return state.filterListChampios!.where((champion) {
      final championTags = champion.tags!;
      return filters.every((filter) => !championTags.contains(filter));
    }).toList();
  }

  startLoading() {
    emit(state.copyWith(requestState: ChampionsRequestState.loading));
  }

  resetLoading() {
    emit(state.copyWith(requestState: ChampionsRequestState.initial));
  }

  void searchChampion(String query) {
    final trimmedQuery = query.trim().toLowerCase();
    if (trimmedQuery.isEmpty) {
      emit(state.copyWith(filterListChampios: state.listChampions));
      return;
    }

    final filteredChampions = state.listChampions!
        .where((champion) =>
            champion.name != null &&
            champion.name!.toLowerCase().contains(trimmedQuery))
        .toList();

    emit(state.copyWith(filterListChampios: filteredChampions));
  }
}
