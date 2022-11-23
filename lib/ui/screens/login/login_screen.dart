import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:polla_futbolera/ui/screens/login/widgets/form_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSigninScreen = true;
  late AnimationController _animationControllerForm;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BounceInUp(
      duration: const Duration(milliseconds: 1600),
      controller: (controller) => _animationControllerForm = controller,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: FormWidget(
              isSigningScreen: _isSigninScreen, onPress: () => changeAction())),
    ));
  }

  void changeAction() => setState(() {
        _animationControllerForm.reset();
        _animationControllerForm.forward();
        _isSigninScreen = !_isSigninScreen;
      });
}
