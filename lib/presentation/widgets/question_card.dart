import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizizz_app/presentation/controllers/question_controller.dart';

import '../../models/Question.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.question});
  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultFontSize),
      padding: EdgeInsets.all(kDefaultFontSize),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
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
          SizedBox(
            height: kDefaultFontSize / 2,
          ),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              textOption: question.options[index],
              press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
