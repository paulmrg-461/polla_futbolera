import 'package:firebase_auth/firebase_auth.dart';
import 'package:polla_futbolera/data/services/api_world_cup/api_world_cup_Signup_service.dart';
import 'package:polla_futbolera/domain/repositories/signup/abstract_signup_repository.dart';

class FirebaseSignUpRepository extends AbstractSignUpRepository {
  FirebaseAuth auth = FirebaseAuth.instance;
  ApiWorldCupSignUpService apiWorldCupSignUpService =
      ApiWorldCupSignUpService();
  @override
  Future<String> doSignUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: email);

      final User? user = userCredential.user;

      await user?.updateDisplayName(name);

      // final UserEntity userEntity = UserEntity.fromJson(user!);

      await user?.sendEmailVerification();

      await apiWorldCupSignUpService.doSignUpApiWorldCup(
          email: email, password: 'Admin123-', name: name);

      return 'Sign up success!';
    } on FirebaseAuthException catch (e) {
      String message =
          'Ha ocurrido un error durante el proceso de registro. ${e.code}';

      switch (e.code) {
        case 'weak-password':
          message =
              'La contraseña es demasiado débil. Por favor intenta nuevamente.';
          break;
        case 'email-already-in-use':
          message =
              'El correo electrónico $email ya se encuentra registrado. Por favor inicia sesión.';
          break;
      }

      return message;
    }
  }
}
