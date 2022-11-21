abstract class AbstractLoginRepository {
  Future<String> doLogin({required String email, required String password});

  Future<void> doLogout();
}
