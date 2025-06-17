import 'package:lol_app/data/models/data_state.dart';

abstract class RiotApiRepository {
  Future<DataState> getAllChampionsData();
  Future<DataState> getDetailChampionData();
}
