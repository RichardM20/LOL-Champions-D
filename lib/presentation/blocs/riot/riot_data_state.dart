import 'package:lol_app/domain/models/champions_data_model.dart';

enum ChampionsRequestState {
  initial,
  loading,
  success,
  error,
}

class HomeState {
  ChampionsRequestState? requestState;
  List<ChampionData>? listChampions;
  List<ChampionData>? filterListChampios;
  List<Tag>? tags;

  String? errorMessage;
  HomeState({
    this.tags,
    this.requestState,
    this.listChampions,
    this.filterListChampios,
    this.errorMessage,
  });
  HomeState copyWith({
    ChampionsRequestState? requestState,
    String? errorMessage,
    List<Tag>? tags,
    List<ChampionData>? filterListChampios,
    List<ChampionData>? listChampions,
  }) =>
      HomeState(
        filterListChampios: filterListChampios ?? this.filterListChampios,
        tags: tags ?? this.tags,
        errorMessage: errorMessage ?? this.errorMessage,
        listChampions: listChampions ?? this.listChampions,
        requestState: requestState ?? this.requestState,
      );
}
