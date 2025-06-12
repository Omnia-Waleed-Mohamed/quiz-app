import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/views/answerScreen.dart';
import 'package:quiz_app/widget/appBarQuiz.dart';
import 'package:quiz_app/widget/questionsList.dart';

class QuizScreen extends StatefulWidget {
  final String userName;

  const QuizScreen({super.key, required this.userName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int selectedOption = -1;
  List<String?> userAnswers = List.filled(questionsList.length, null);
  Timer? timer;
  int timeLeft = 30;

  void startTimer() {
    timeLeft = 30;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        timeLeft--;
        if (timeLeft == 0) {
          goToNext();
        }
      });
    });
  }

  void goToNext() {
    if (selectedOption != -1) {
      userAnswers[currentIndex] =
          questionsList[currentIndex].answers[selectedOption];
    }

    if (currentIndex < questionsList.length - 1) {
      setState(() {
        currentIndex++;
        selectedOption = -1;
      });
      startTimer();
    } else {
      timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => AnswerScreen(
            userAnswers: userAnswers,
            userName: widget.userName,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = questionsList[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xffEFF0F3),
      appBar: CustomQuizAppBar(title: "${currentIndex + 1}/${questionsList.length}"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 40),
                  child: Card(
                    color: const Color.fromARGB(235, 255, 255, 255),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadowColor: Colors.grey.withOpacity(0.4),
                    child: Container(
                      height: 190,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      child: Text(
                        question.question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: MediaQuery.of(context).size.width / 2 - 39,
                  child: Container(
                    width: 67,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: CircularPercentIndicator(
                      radius: 41.0,
                      lineWidth: 6.0,
                      percent: (30 - timeLeft) / 30,
                      animation: true,
                      animateFromLastPercent: true,
                      center: Text(
                        "$timeLeft",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff473F97),
                        ),
                      ),
                      progressColor: const Color(0xff473F97),
                      backgroundColor: Colors.grey[300]!,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            for (int i = 0; i < question.answers.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOption = i;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    color: selectedOption == i ? const Color(0xffD7DBF5) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selectedOption == i
                          ? const Color(0xff473F97)
                          : Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          question.answers[i],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff473F97),
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                      Icon(
                        selectedOption == i
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: selectedOption == i
                            ? const Color(0xff473F97)
                            : Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: selectedOption == -1 ? null : goToNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedOption == -1
                      ? Colors.grey
                      : const Color(0xff473F97),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  currentIndex == questionsList.length - 1 ? "Finish" : "Next",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
