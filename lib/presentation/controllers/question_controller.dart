import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizizz_app/main.dart';
import 'package:quizizz_app/models/Question.dart';
import 'package:quizizz_app/models/model.dart';
import 'package:quizizz_app/presentation/pages/score_page.dart';

//we use get package for our state management
class QuestionController extends GetxController {
  late PageController _pageController;
  PageController get pageController => _pageController;
  final file = GetStorage();

  final List<Question> _questions = sample_data
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index'],
          ))
      .toList();

  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  PlayerHistory? _lastPlayerResult;
  set lastPlayerHistory(PlayerHistory playerHistory) =>
      _lastPlayerResult = playerHistory;

  //called immediately after the widget is allocated memory
  @override
  void onInit() {
    super.onInit();
    _pageController = PageController();
  }

  @override
  void onReady() {
    super.onReady();
    if (_lastPlayerResult != null && _lastPlayerResult!.resumeFrom >= 0) {
      _pageController.jumpToPage(_lastPlayerResult!.resumeFrom);
    }
  }

  //called just before the controller is deleted from memory
  @override
  void onClose() {
    if (questionNumber.value > 1) {
      if (_lastPlayerResult != null &&
          _lastPlayerResult!.resumeFrom >= 0 &&
          questionNumber.value < questions.length) {
        updatePlayerHistory(
          playerHistory: _lastPlayerResult!,
          resumeIdx: _questionNumber.value - 1,
        );
      } else {
        insertPlayerHistory(resumeIdx: _questionNumber.value - 1);
      }
    }
    _pageController.dispose();

    super.onClose();
  }

  void checkAns(Question question, int selectedIndex) {
    //because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    update();

    //Once user select an ans after 1s it will go to the next question
    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      // save player record to supabase

      var score = numOfCorrectAns;
      if (_lastPlayerResult != null && _lastPlayerResult!.resumeFrom >= 0) {
        score += _lastPlayerResult!.score;
        updatePlayerHistory(playerHistory: _lastPlayerResult!);
      } else {
        insertPlayerHistory();
      }
      Get.off(() => const ScorePage(), arguments: score);
    }
  }

  Future<void> updatePlayerHistory(
      {required PlayerHistory playerHistory, int resumeIdx = -1}) async {
    await supabase.player_history
        .update(PlayerHistory.update(
            score: numOfCorrectAns + playerHistory.score,
            resumeFrom: resumeIdx))
        .eq(PlayerHistory.c_id, playerHistory.id);
  }

  Future<void> insertPlayerHistory({int resumeIdx = -1}) async {
    final curPlayer = file.read('player') as Player;

    await supabase.player_history.insert(PlayerHistory.insert(
        score: numOfCorrectAns, resumeFrom: resumeIdx, playerId: curPlayer.id));
  }

  void updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
