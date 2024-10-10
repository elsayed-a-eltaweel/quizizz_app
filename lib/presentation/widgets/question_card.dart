import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizizz_app/presentation/controllers/question_controller.dart';

import '../../models/Question.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard({super.key, required this.question});
  final Question question;
  final controller = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 32),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              textOption: question.options[index],
              press: () => controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
