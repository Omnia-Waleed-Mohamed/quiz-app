import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/widget/appBarQuiz.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int selectedOption = -1;

  List<String> options = [
    "1986",
    "1994",
    "2002",
    "2010",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFF0F3),
      appBar: const CustomQuizAppBar(title: "7/10"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Stack to overlap circle over card
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Card with question
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 40), // space for circle
                  child: Card(
                    color: Color.fromARGB(235, 255, 255, 255),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadowColor: Colors.grey.withOpacity(0.4),
                    child: Container(
                      height: 190,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      child: const Text(
                        "In what year did the United States host the FIFA World Cup for the first time?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                  left: MediaQuery.of(context).size.width / 2 -
                      39, // خليها على حسب الـ radius
                  child: Container(
                    width:
                        78, // لازم يكون قطر الدايرة = radius * 2 + padding (اختياري)
                    height: 78,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(
                        4), // padding داخلي صغير عشان الفل ميركبش على الدايرة
                    child: CircularPercentIndicator(
                      radius: 39.0,
                      lineWidth: 6.0,
                      percent: 0.75,
                      animation: true,
                      animationDuration: 1200,
                      center: const Text(
                        "30",
                        style: TextStyle(
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

            // الخيارات
            for (int i = 0; i < options.length; i++)
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
                    color: selectedOption == i
                        ? const Color(0xffD7DBF5)
                        : Colors.white,
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
                          options[i],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff2D2D2D),
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

            // زر Next
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // logic للانتقال للسؤال التالي
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff473F97),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
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
