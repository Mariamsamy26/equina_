import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:equina_task/app/start_app_cycle/views/splash_screen.dart';
import 'package:equina_task/styles/text_mang.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              titleTextStyle: TextManager.medium(),
            ),
            textTheme: TextTheme(
              bodyLarge: TextManager.regular(),
              titleLarge: TextManager.bold(),
              labelLarge: TextManager.medium(),
            ),
          ),
          home:  const SplashScreen(),
        );
      },
    );
  }
}