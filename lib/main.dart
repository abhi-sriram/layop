import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:layop/pages/auth/login_page.dart';
import 'package:layop/pages/ocr/ocr_page.dart';
import 'package:layop/pages/quiz/attempt_exam_page.dart';
import 'package:layop/pages/quiz/final_answers_reveal_page.dart';
import 'package:layop/pages/splash_screen.dart';
import 'package:layop/pages/student_home.dart';
import 'package:layop/util/app_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(backgroundColor: AppConstant.primaryColor),
          scaffoldBackgroundColor: const Color(0xfff2f2f2)),
      debugShowCheckedModeBanner: false,
      routes: {
        FinalAnswersRevelaPage.routeName: (_) =>   const FinalAnswersRevelaPage(),
      },
      // home: ParentHome(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else if (snapshot.hasData) {
            return const StudentHome();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
