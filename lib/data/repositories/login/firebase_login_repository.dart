import 'package:firebase_auth/firebase_auth.dart';
import 'package:polla_futbolera/data/services/api_world_cup/api_world_cup_login_service.dart';
import 'package:polla_futbolera/data/services/user/shared_preferences_service.dart';
import 'package:polla_futbolera/domain/repositories/login/abstract_login_repository.dart';

class FirebaseLoginRepository extends AbstractLoginRepository {
  FirebaseAuth auth = FirebaseAuth.instance;
  ApiWorldCupLoginService apiWorldCupLoginService = ApiWorldCupLoginService();

  @override
  Future<String> doLogin(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: email);
      // final UserEntity userEntity = UserEntity.fromJson(userCredential.user!);
      final String apiWorldCupToken = await apiWorldCupLoginService
          .doLoginApiWorldCup(email: email, password: 'Admin123-');
      final String token = await userCredential.user!.getIdToken();
      //Save token SharedPreferences
      SharedPreferencesService.token = token;
      SharedPreferencesService.apiWorldCupToken = apiWorldCupToken;

      return 'Login success!';
    } on FirebaseAuthException catch (e) {
      String message =
          'Ha ocurrido un error durante el proceso de registro. ${e.code}';

      switch (e.code) {
        case 'user-not-found':
          message =
              'El correo electrónico $email aún no se encuentra registrado. Por favor realiza el proceso de registro.';
          break;
        case 'wrong-password':
          message =
              'Nombre de usuario o contraseña incorrectos. Por favor intenta nuevamente.';
          break;
      }

      return message;
    }
  }

  @override
  Future<void> doLogout() {
    SharedPreferencesService.token = '';
    return auth.signOut();
  }
}
