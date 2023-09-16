import 'package:lol_app/domain/models/champion_detail_data_model.dart';
import 'package:lol_app/domain/models/champions_data_model.dart';

enum ChampionDetailState {
  initial,
  loading,
  success,
  error,
}

class DetailState {
  ChampionDetailState? requestState;
  Champion? championDetail;
  int? indexPage;
  String? errorMessage;
  DetailState({
    this.requestState,
    this.championDetail,
    this.indexPage,
    this.errorMessage,
  });
  DetailState copyWith({
    ChampionDetailState? requestState,
    String? errorMessage,
    List<ChampionData>? filterListChampios,
    Champion? championDetail,
    int? indexPage,
  }) =>
      DetailState(
        indexPage: indexPage ?? this.indexPage,
        errorMessage: errorMessage ?? this.errorMessage,
        championDetail: championDetail ?? this.championDetail,
        requestState: requestState ?? this.requestState,
      );
}
