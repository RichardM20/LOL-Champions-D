import 'package:lol_app/data/models/data_state.dart';
import 'package:lol_app/data/repositories/riot_api_repository_imp.dart';

class RiotApiUsecase {
  late final RiotApiRepositoryImp _apiRepositoryImp;
  RiotApiUsecase(this._apiRepositoryImp);

  Future<DataState> getAllChampionsData() async {
    return await _apiRepositoryImp.getAllChampionsData();
  }

  Future<DataState> getDetailChampionData({
    required String championName,
  }) async {
    return await _apiRepositoryImp.getDetailChampionData(
      championName: championName,
    );
  }
}
