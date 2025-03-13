import 'package:firebase_core/firebase_core.dart';
import 'package:fleetgo/presentation/screens/auth/splash_screen.dart';
import 'package:fleetgo/resources/themes/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA48zEzLIHjMau1fOjRkq1T3ROQF6JIKnI",
            authDomain: "fleetgo-c76c3.firebaseapp.com",
            projectId: "fleetgo-c76c3",
            storageBucket: "fleetgo-c76c3.firebasestorage.app",
            messagingSenderId: "1097929083749",
            appId: "1:1097929083749:web:d646269fc7b87a6eca2f8c",
            measurementId: "G-7W87ZGVRH5"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TAppTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
