import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:quiz/core/Models/question.dart';
import 'package:quiz/core/Models/question_answer_result.dart';
import 'package:quiz/core/resources/routes/routes_names.dart';
import 'package:quiz/data/question%20data/quuestion_data.dart';

class MainScreenController {
  late BuildContext _context;
  Timer? _timer;
  int _timeCounterValue = 10;
  late String _playerName;
  late int? _selectedAnswerIndex;
  late int currentQuestionIndex;
  late int _questionsCount;
  get questionsCount => _questionsCount;
  static late List<Question> questionsList;
  static late List<QuestionAnswerResult> _resultAnswers;

  late StreamController<int> _selectedIndexStreamController;
  late Stream<int> _selectedIndexStream;
  late Sink<int> _selectedIndexSink;
  get selectedIndexStream => _selectedIndexStream;

  late StreamController<int> _currentQuestionIndexStreamController;
  late Stream<int> _currentQuestionIndexStream;
  late Sink<int> _currentQuestionIndexSink;
  get currentQuestionIndexStream => _currentQuestionIndexStream;

  late StreamController<double> _percentStreamController;
  late Stream<double> _percentStream;
  late Sink<double> _percentSink;
  get percentStream => _percentStream;

  late StreamController<int> _counterStreamController;
  late Stream<int> _counterStream;
  late Sink<int> _counterSink;
  get counterStream => _counterStream;

  late StreamController<Question> _questionStreamController;
  late Stream<Question> _questionStream;
  late Sink<Question> _questionSink;
  get questionStream => _questionStream;

  MainScreenController({required BuildContext context, int questionsCount = 10}) {
    _questionsCount = questionsCount;
    _context = context;
    _counterStreamController = StreamController();
    _counterStream = _counterStreamController.stream.asBroadcastStream();
    _counterSink = _counterStreamController.sink;

    _currentQuestionIndexStreamController = StreamController();
    _currentQuestionIndexStream = _currentQuestionIndexStreamController.stream
        .asBroadcastStream();
    _currentQuestionIndexSink = _currentQuestionIndexStreamController.sink;

    _selectedIndexStreamController = StreamController();
    _selectedIndexStream = _selectedIndexStreamController.stream
        .asBroadcastStream();
    _selectedIndexSink = _selectedIndexStreamController.sink;
    _questionStreamController = StreamController<Question>();
    _questionStream = _questionStreamController.stream.asBroadcastStream();
    _questionSink = _questionStreamController.sink;

    _percentStreamController = StreamController();
    _percentSink = _percentStreamController.sink;
    _percentStream = _percentStreamController.stream.asBroadcastStream();
  }

  void onOptionSelected(int index) {
    _selectedAnswerIndex = index;
    _selectedIndexSink.add(_selectedAnswerIndex!);
  }

  void startQuiz({required String playerName}) {
    currentQuestionIndex = 0;
    _selectedAnswerIndex = -1;
    _selectedIndexSink.add(_selectedAnswerIndex!);
    _currentQuestionIndexSink.add(currentQuestionIndex + 1);
    questionsList = getQuestionsList();
    _questionSink.add(questionsList[currentQuestionIndex]);
    restartCounter();
    _playerName = playerName;
    _resultAnswers = [];
  }

  void restartCounter() {
    // Cancel any previous timer before starting a new one
    _timer?.cancel();

    int remaining = _timeCounterValue;
    _counterSink.add(remaining);
    _percentSink.add(remaining / _timeCounterValue);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remaining--;
      if (remaining >= 0) {
        _counterSink.add(remaining);
        _percentSink.add(remaining / _timeCounterValue);
      }
      if (remaining <= 0) {
        timer.cancel();
        onNextButtonPressed();
      }
    });
  }
void onNextButtonPressed() {
  _timer?.cancel();

  // Safety check
  if (currentQuestionIndex < 0 || currentQuestionIndex >= questionsList.length) {
    goToAnswerScreen();
    return;
  }

  final question = questionsList[currentQuestionIndex];
  final int correctIndex = question.correctAnswerIndex;

  bool isCorrect = _selectedAnswerIndex != null && _selectedAnswerIndex == correctIndex;

  String correctAnswerText =
      (correctIndex >= 0 && correctIndex < question.answers.length)
          ? question.answers[correctIndex]
          : "Invalid correct answer";

  String selectedAnswerText = (_selectedAnswerIndex != null &&
          _selectedAnswerIndex! >= 0 &&
          _selectedAnswerIndex! < question.answers.length)
      ? question.answers[_selectedAnswerIndex!]
      : "You skipped this question";

  _resultAnswers.add(
    QuestionAnswerResult(
      questionNumber: currentQuestionIndex + 1,
      question: question.question,
      isCorrect: isCorrect,
      correctAnswer: correctAnswerText,
      wrongAnswer: selectedAnswerText,
    ),
  );

  // Next question
  currentQuestionIndex++;

  if (currentQuestionIndex < _questionsCount && currentQuestionIndex < questionsList.length) {
    _selectedAnswerIndex = null;
    _questionSink.add(questionsList[currentQuestionIndex]);
    _selectedIndexSink.add(-1); // UI = nothing selected
    _currentQuestionIndexSink.add(currentQuestionIndex + 1);
    restartCounter();
  } else {
    goToAnswerScreen();
  }
}


  List<Question> getQuestionsList() {
    // Make a copy of the original list to avoid mutating it directly
    final questions = List<Question>.from(QuestionData().questions);

    questions.shuffle();

    // Take 'count' random items
    return questions.take(_questionsCount).toList();
  }

  void goToAnswerScreen() {
    Navigator.pushNamed(
      _context,
      RoutesNames.answerScreen,
      arguments: {"name": _playerName, "list": _resultAnswers},
    );
  }

  void dispose() {
    _timer?.cancel();
    _selectedIndexStreamController.close();
    _percentStreamController.close();
    _counterStreamController.close();
    _questionStreamController.close();
  }
}
