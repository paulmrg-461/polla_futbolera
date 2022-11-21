abstract class AbstractSignUpRepository {
  Future<String> doSignUp(
      {required String email, required String password, required String name});
}
