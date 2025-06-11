import 'package:flutter/material.dart';
import 'package:quiz_app/models/onBoardingModel.dart';


class OnBoardingPages extends StatelessWidget {
  final PageController controller;
  final List<OnBoardingModel> pages;

  const OnBoardingPages({
    super.key,
    required this.controller,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: pages.length,
      itemBuilder: (context, index) {
        final page = pages[index];
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Image.asset(
                page.image,
                height: 250,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),
             
              Text(
                page.title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                  color: Color(0xff3D003E)
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
             
              Text(
                page.description,
                style: const TextStyle(
                  fontSize: 16,
                  color:Color(0xff3D003E),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
