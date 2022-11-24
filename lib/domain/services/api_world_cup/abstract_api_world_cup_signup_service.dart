abstract class AbstractApiWorldCupSignUpService {
  Future<String> doSignUpApiWorldCup(
      {required String email, required String password, required String name});
}
