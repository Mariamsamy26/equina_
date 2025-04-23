import 'dart:async';

import 'package:equina_task/app/start_app_cycle/views/onbording_screen.dart';
import 'package:equina_task/helpers/application_dimentions.dart';
import 'package:equina_task/helpers/navigation_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName ="Sprash screen";
  
  
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
@override
void initState(){
  super.initState();
  Future.delayed(Duration(milliseconds: 1500),(){
    Navigation().goToScreen(context,(context)=> OnbordingScreen());
  });
}

  @override
  Widget build(BuildContext context) {
    AppDimentions().appDimentionsInit(context);
    return Container(
    height: AppDimentions().availableheightWithAppBar,
    width: AppDimentions().availableWidth,
     child: Image.asset("assets/images/full_splash.png",
     fit: BoxFit.cover,
     ),
    );
  }

  @override
    
  void dispose(){
   super.initState();
  }
}