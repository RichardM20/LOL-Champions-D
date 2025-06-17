import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_app/data/models/data_state.dart';
import 'package:lol_app/domain/usecases/riot_api_usecase.dart';
import 'package:lol_app/presentation/blocs/detail/detail_state.dart';

class DetailPageCubit extends Cubit<DetailState> {
  late final RiotApiUsecase _riotApiUsecase;
  DetailPageCubit(this._riotApiUsecase)
      : super(
          DetailState(
            indexPage: 0,
            championDetail: null,
            errorMessage: '',
            requestState: ChampionDetailState.initial,
          ),
        );
        
  getDetailChampion({String? championName}) async {
    resetLoading();
    startLoading();
    final result = await _riotApiUsecase.getDetailChampionData(
      championName: championName ?? "",
    );

    if (result is DataSuccess) {
      emit(
        state.copyWith(
          championDetail: result.data,
          requestState: ChampionDetailState.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          errorMessage: result.props.first.toString(),
          requestState: ChampionDetailState.error,
        ),
      );
    }
  }

  changeIndexPage(int v) {
    emit(state.copyWith(indexPage: v));
  }

  startLoading() {
    emit(state.copyWith(requestState: ChampionDetailState.loading));
  }

  resetLoading() {
    emit(state.copyWith(requestState: ChampionDetailState.initial));
  }
}
