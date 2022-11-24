import 'package:dio/dio.dart';
import 'package:polla_futbolera/domain/services/api_world_cup/abstract_api_world_cup_login_service.dart';
import 'package:polla_futbolera/global/enviroment.dart';

class ApiWorldCupLoginService extends AbstractApiWorldCupLoginService {
  @override
  Future<String> doLoginApiWorldCup(
      {required String email, required String password}) async {
    final Dio dio = Dio();
    final Response response = await dio.post(
        '${Enviroment.freeApiWorldCupBaseUrl}user/login',
        data: {"email": email, "password": password},
        options: Options(headers: {"Content-Type": "application/json"}));
    return response.data['data']['token'];
  }
}
