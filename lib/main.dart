import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:polla_futbolera/data/services/user/shared_preferences_service.dart';
import 'package:polla_futbolera/domain/services/firebase/firebase_options.dart';
import 'package:polla_futbolera/ui/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Init shared preferences
  await SharedPreferencesService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
