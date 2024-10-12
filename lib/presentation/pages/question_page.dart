import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizizz_app/models/model.dart';
import 'package:quizizz_app/presentation/controllers/question_controller.dart';
import 'package:quizizz_app/presentation/widgets/question_card.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({super.key});

  final _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    final lastPlayerResult =
        Get.arguments != null ? Get.arguments as PlayerHistory : null;
    if (lastPlayerResult != null) {
      _questionController.lastPlayerHistory = lastPlayerResult;
    }
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Number Of Questions
              Obx(
                () => Text.rich(
                  TextSpan(
                    text:
                        'Question ${_questionController.questionNumber.value}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: Colors.white),
                    children: [
                      TextSpan(
                        text: '/${_questionController.questions.length}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: 16),
              Expanded(
                child: PageView.builder(
                  //Block swipe to next question
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateQuestionNumber,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
