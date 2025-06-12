import 'package:flutter/material.dart';

class AnswerScreen extends StatelessWidget {
  final List<String?> userAnswers;

  const AnswerScreen({super.key, required this.userAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Answers")),
      body: ListView.builder(
        itemCount: userAnswers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Q${index + 1}: ${userAnswers[index] ?? "No Answer"}"),
          );
        },
      ),
    );
  }
}
