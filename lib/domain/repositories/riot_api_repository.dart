import 'package:lol_app/data/models/data_state.dart';
import 'package:lol_app/domain/models/champions_data_model.dart';

abstract class RiotApiRepository {
  Future<DataState> getAllChampionsData();
  Future<DataState> getDetailChampionData();
}
