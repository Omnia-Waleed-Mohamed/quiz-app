import 'package:flutter/material.dart';
import 'package:quiz_app/views/splashScreen.dart';

void main(){
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()

    );
  }
}