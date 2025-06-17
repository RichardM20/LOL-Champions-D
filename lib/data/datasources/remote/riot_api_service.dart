import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lol_app/app/utils/env.dart';
import 'package:lol_app/data/models/data_state.dart';
import 'package:lol_app/domain/models/champion_detail_data_model.dart';
import 'package:lol_app/domain/models/champions_data_model.dart';

class RiotApiService {
  Future<DataState> getAllChampionsRequest({required String path}) async {
    final response = await http.get(
      Uri.parse('${Environment.api}$path'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      final List<ChampionData> championsData = [];
      List<ChampionsModel> listChampions = [
        ChampionsModel.fromJson(responseData)
      ];
      listChampions[0].data!.forEach((key, value) {
        championsData.add(value);
      });
      return DataSuccess(championsData);
    }

    return DataFailed(Exception(response.statusCode));
  }

  Future<DataState> getDetailChampionRequest({required String path}) async {
    final response = await http.get(
      Uri.parse('${Environment.api}champion/$path'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    late Champion championData;
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map decodeResponse = jsonDecode(response.body);

      Map<String, dynamic> mapResponseData = decodeResponse['data'];

      mapResponseData.forEach((key, value) {
        final data = jsonEncode(value);

        championData = Champion.fromJson(jsonDecode(data));
      });

      return DataSuccess(championData);
    }
    return DataFailed(Exception(response.statusCode));
  }
}
