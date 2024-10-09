import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizizz_app/presentation/controllers/question_controller.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
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
                  Spacer(flex: 3),
                  Text(
                    'Score',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    '${_qnController.correctAns * 10}/${_qnController.questions.length * 10}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
