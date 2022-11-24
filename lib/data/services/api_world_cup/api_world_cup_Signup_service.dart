import 'package:dio/dio.dart';
import 'package:polla_futbolera/domain/services/api_world_cup/abstract_api_world_cup_signup_service.dart';
import 'package:polla_futbolera/global/enviroment.dart';

class ApiWorldCupSignUpService extends AbstractApiWorldCupSignUpService {
  @override
  Future<String> doSignUpApiWorldCup(
      {required String email,
      required String password,
      required String name}) async {
    final Dio dio = Dio();
    final Response response =
        await dio.post('${Enviroment.freeApiWorldCupBaseUrl}user',
            data: {
              "name": name,
              "email": email,
              "password": password,
              "passwordConfirm": password,
            },
            options: Options(headers: {"Content-Type": "application/json"}));
    return response.data['data']['token'];
  }
}
