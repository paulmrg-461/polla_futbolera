import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:polla_futbolera/data/services/user/shared_preferences_service.dart';
import 'package:polla_futbolera/domain/entities/match_entity.dart';
import 'package:polla_futbolera/global/enviroment.dart';

class ApiWordCupRequestsService {
  static Dio dio = Dio();
  static Options options = Options(headers: {
    "Content-Type": "application/json",
    "Authorization": "Bearer ${SharedPreferencesService.apiWorldCupToken}"
  });

  static Future<List<MatchEntity>> getScores() async {
    final Response response = await dio
        .get('${Enviroment.freeApiWorldCupBaseUrl}match', options: options);

    if (response.data['status'] == 'success') {
      final Iterable list = response.data['data'];
      return list.map((match) => MatchEntity.fromJson(match)).toList();
    } else {
      return [];
    }
  }
}
