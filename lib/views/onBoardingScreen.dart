import 'package:flutter/material.dart';
import 'package:quiz_app/models/onBoardingModel.dart';
import 'package:quiz_app/views/loginScreen.dart';
import 'package:quiz_app/widget/bottomNavigation.dart';
import 'package:quiz_app/widget/onBoarding_pages.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  double currentIndexPage = 0;

  final List<OnBoardingModel> pages = [
    OnBoardingModel(
      "assets/image/onboarding1.png",
      "Welcome to QuizMaster!",
      "Test your knowledge with fun and challenging quizzes across multiple categories.",
    ),
    OnBoardingModel(
      "assets/image/onboarding2.png",
      "Track Your Progress",
      "Keep an eye on your score and improve with every attempt. Learn while playing!",
    ),
    OnBoardingModel(
      "assets/image/onboarding3.png",
      "Challenge Yourself",
      "Take timed quizzes, unlock achievements, and compete with friends!",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentIndexPage = _controller.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) =>  LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingPages(
        controller: _controller,
        pages: pages,
      ),
      bottomNavigationBar: OnBoardingBottomNav(
        currentIndexPage: currentIndexPage,
        pageCount: pages.length,
        onNext: () {
          if (currentIndexPage < pages.length - 1) {
            _controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          } else {
            goToLogin();
          }
        },
        onSkip: goToLogin,
      ),
    );
  }
}

