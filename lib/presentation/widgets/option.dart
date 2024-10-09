import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizizz_app/presentation/controllers/question_controller.dart';

class Option extends StatelessWidget {
  final String textOption;
  final int index;
  final VoidCallback press;
  const Option(
      {super.key,
      required this.textOption,
      required this.index,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRigtColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return Colors.green;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return Colors.red;
              }
            }
            return Colors.grey;
          }

          IconData getTheRightIcon() {
            return getTheRigtColor() == Colors.red ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultFontSize),
              padding: EdgeInsets.all(kDefaultFontSize),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRigtColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${index + 1}. $textOption',
                    style: TextStyle(color: getTheRigtColor(), fontSize: 16),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getTheRigtColor() == Colors.grey
                          ? Colors.transparent
                          : getTheRigtColor(),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: getTheRigtColor()),
                    ),
                    child: getTheRigtColor() == Colors.grey
                        ? null
                        : Icon(getTheRightIcon(),
                            size: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
