import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizizz_app/presentation/controllers/question_controller.dart';
import 'package:quizizz_app/presentation/widgets/question_card.dart';
import 'package:websafe_svg/websafe_svg.dart';

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    // QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: _questionController.nextQuestion,
              child: Text(
                'skip',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: Stack(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //progressBar shape
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultFontSize),
                    child: Container(
                      width: double.infinity,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(50),
                      ),

                      // Progress Bar
                      child: GetBuilder<QuestionController>(
                        init: QuestionController(),
                        builder: (controller) {
                          return Stack(
                            children: [
                              LayoutBuilder(
                                builder: (context, Constraints) => Container(
                                  width: Constraints.maxWidth *
                                      controller.animation.value, //cover 50%
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.green,
                                          Colors.greenAccent,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              Positioned.fill(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultFontSize / 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${(controller.animation.value * 60).round()} sec',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    WebsafeSvg.asset('assets/icons/clock.svg'),
                                  ],
                                ),
                              ))
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: kDefaultFontSize,
                  ),

                  //Number Of Questions
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultFontSize),
                      child: Obx(
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
                                text:
                                    '/${_questionController.questions.length}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultFontSize),
                    child: Divider(thickness: 1.5),
                  ),
                  SizedBox(height: kDefaultFontSize),

                  Expanded(
                    child: PageView.builder(
                      //Block swipe to next question
                      physics: NeverScrollableScrollPhysics(),
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
        ],
      ),
    );
  }
}
