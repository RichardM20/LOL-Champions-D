import 'package:lol_app/data/datasources/remote/riot_api_service.dart';
import 'package:lol_app/data/models/data_state.dart';
import 'package:lol_app/domain/models/champions_data_model.dart';
import 'package:lol_app/domain/repositories/riot_api_repository.dart';

class RiotApiRepositoryImp implements RiotApiRepository {
  late final RiotApiService _riotApiService;
  RiotApiRepositoryImp(this._riotApiService);
  @override
  Future<DataState> getAllChampionsData() async {
    return await _riotApiService.getAllChampionsRequest(path: 'champion.json');
  }

  @override
  Future<DataState> getDetailChampionData({String? championName}) async {
    return await _riotApiService.getDetailChampionRequest(
      path: championName ?? "Aatrox.json",
    );
  }
  //code here
}
