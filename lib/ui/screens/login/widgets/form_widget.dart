import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polla_futbolera/data/repositories/login/firebase_login_repository.dart';
import 'package:polla_futbolera/data/repositories/signup/firebase_signup_repository.dart';
import 'package:polla_futbolera/ui/shared/custom_alert_dialog.dart';
import 'package:polla_futbolera/ui/shared/custom_button.dart';
import 'package:polla_futbolera/ui/shared/custom_input.dart';
import 'package:polla_futbolera/ui/themes/main_theme.dart';

class FormWidget extends StatefulWidget {
  final bool isSigningScreen;
  final VoidCallback onPress;
  const FormWidget(
      {super.key, required this.isSigningScreen, required this.onPress});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseSignUpRepository _firebaseSignUpRepository =
      FirebaseSignUpRepository();
  final FirebaseLoginRepository _firebaseLoginRepository =
      FirebaseLoginRepository();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.16,
          ),
          SizedBox(
            height: size.height * 0.15,
            child:
                const Image(image: AssetImage('assets/logos/logo_qatar.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 52,
            ),
            child: Text(
              'Polla mundialista Guerrero\'s',
              style: GoogleFonts.nunito(
                  color: MainTheme.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 26),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 26, top: 8),
            child: Text(
              widget.isSigningScreen
                  ? 'Para continuar, inicia sesión'
                  : 'Regístrate',
              style: GoogleFonts.nunito(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
          !widget.isSigningScreen
              ? CustomInput(
                  hintText: 'Nombre completo',
                  textController: _nameController,
                  textInputType: TextInputType.name,
                  icon: Icons.person_2_outlined)
              : const SizedBox(),
          CustomInput(
              hintText: 'Correo electrónico',
              textController: _emailController,
              textInputType: TextInputType.emailAddress,
              icon: Icons.email_outlined),
          CustomInput(
            hintText: 'Contraseña',
            textController: _passwordController,
            icon: Icons.lock_outline_rounded,
            obscureText: true,
            passwordVisibility: true,
          ),
          CustomButton(
              text: widget.isSigningScreen ? 'Iniciar sesión' : 'Registrarme',
              onPressed: () => widget.isSigningScreen ? signIn() : signUp()),
          Padding(
            padding: const EdgeInsets.only(bottom: 26, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.isSigningScreen
                      ? '¿Eres nuevo?'
                      : '¿Ya tienes una cuenta?',
                  style: GoogleFonts.nunito(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: widget.onPress,
                  child: Text(
                    widget.isSigningScreen ? 'Regístrate' : 'Inicia sesión',
                    style: GoogleFonts.nunito(
                        color: MainTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void signUp() async {
    final String signUpResponse = await _firebaseSignUpRepository.doSignUp(
        email: _emailController.text.trim().toLowerCase(),
        password: _emailController.text,
        name: _nameController.text.trim());

    if (signUpResponse == 'Sign up success!') {
      CustomAlertDialog().showCustomDialog(
          context: context,
          title: 'Registro exitoso',
          content:
              'El proceso de registro ha sido exitoso, hemos enviado un correo electrónico para verificar su identidad. Una vez sea verificado, por favor inicie sesión.',
          actionText: 'Aceptar');
      widget.onPress();
    } else {
      CustomAlertDialog().showCustomDialog(
          context: context,
          title: 'Ha ocurrido un error durante el proceso de registro',
          content: signUpResponse,
          actionText: 'Aceptar');
    }
  }

  void signIn() async {
    final String loginResponse = await _firebaseLoginRepository.doLogin(
        email: _emailController.text.trim().toLowerCase(),
        password: _emailController.text);
    if (loginResponse == 'Login success!') {
      Navigator.pushReplacementNamed(context, 'home_screen');
    } else {
      CustomAlertDialog().showCustomDialog(
          context: context,
          title: 'Ha ocurrido un error durante al iniciar sesión',
          content: loginResponse,
          actionText: 'Aceptar');
    }
  }
}
