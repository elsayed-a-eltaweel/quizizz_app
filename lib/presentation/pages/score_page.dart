import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizizz_app/presentation/controllers/question_controller.dart';
import 'package:quizizz_app/presentation/pages/home_page.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    int score = Get.arguments as int;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo,
                  Colors.purple,
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const Spacer(flex: 3),
                  Text(
                    'Score',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  const Spacer(),
                  Text(
                    '${score * 10}/${_qnController.questions.length * 10}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  const Spacer(flex: 3),
                  ElevatedButton(
                    onPressed: () {
                      Get.off(() => HomePage());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    child: const Text(
                      'Play again',
                    ),
                  ),
                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
