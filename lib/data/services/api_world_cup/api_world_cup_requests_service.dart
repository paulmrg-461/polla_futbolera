import 'package:dio/dio.dart';
import 'package:polla_futbolera/data/services/firestore/match/match_firestore_service.dart';
import 'package:polla_futbolera/data/services/user/shared_preferences_service.dart';
import 'package:polla_futbolera/domain/entities/match_entity.dart';
import 'package:polla_futbolera/global/enviroment.dart';

class ApiWordCupRequestsService {
  static Dio dio = Dio();
  static Options options = Options(headers: {
    "Content-Type": "application/json",
    "Authorization": "Bearer ${SharedPreferencesService.apiWorldCupToken}"
  });

  static Future<void> uploadNewScoresToFirestore() async {
    final Response response = await dio
        .get('${Enviroment.freeApiWorldCupBaseUrl}match', options: options);
    if (response.data['status'] == 'success') {
      final Iterable list = response.data['data'];
      list.forEach((match) async {
        final MatchEntity matchEntity = MatchEntity.fromJson(match);
        await MatchFirestoreService.insertNewMatchesToFirestore(matchEntity);
      });
    }
  }
}
