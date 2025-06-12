import 'package:flutter/material.dart';
import 'package:quiz_app/widget/questionsList.dart';

class AnswerScreen extends StatelessWidget {
  final List<String?> userAnswers;
  final String userName;

  const AnswerScreen({
    Key? key,
    required this.userAnswers,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int correctAnswers = 0;

    for (int i = 0; i < questionsList.length; i++) {
      if (userAnswers[i] == questionsList[i].correctAnswer) {
        correctAnswers++;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xff473F97),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // ← التعديل هنا
                  children: [
                    Text(
                      'Name : $userName',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff473F97),
                        fontFamily: "Montserrat",
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Grade : $correctAnswers / ${questionsList.length}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff473F97),
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              
              for (int i = 0; i < questionsList.length; i++)
                buildQuestionCard(i, userAnswers),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuestionCard(int index, List<String?> userAnswers) {
    final question = questionsList[index];
    final isCorrect = userAnswers[index] == question.correctAnswer;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          CircleAvatar(
            radius: 14,
            backgroundColor: isCorrect ? Colors.green[800] : Colors.red[800],
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),

        
          Text(
            question.question,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

         
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Icon(
                  isCorrect ? Icons.check_circle : Icons.cancel,
                  color: isCorrect ? Colors.green : Colors.red,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    userAnswers[index] ?? "No answer",
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          if (!isCorrect) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      question.correctAnswer,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
