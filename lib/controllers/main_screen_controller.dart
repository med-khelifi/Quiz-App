import 'dart:async';

import 'package:quiz/core/Models/question.dart';
import 'package:quiz/data/question%20data/quuestion_data.dart';

class MainScreenController {
  Timer? _timer;

  late int _selectedAnswerIndex;
  late int currentQuestionIndex;
  late int questionsCount;
  static late List<Question> questionsList;

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

  MainScreenController({int count = 10}) {
    questionsCount = count;

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
    _selectedIndexSink.add(_selectedAnswerIndex);
  }

  void startQuiz() {
    currentQuestionIndex = 0;
    _selectedAnswerIndex = -1;
    _selectedIndexSink.add(_selectedAnswerIndex);
    _currentQuestionIndexSink.add(currentQuestionIndex + 1);
    questionsList = getQuestionsList();
    _questionSink.add(questionsList[currentQuestionIndex]);
    restartCounter();
  }

  void restartCounter() {
    // Cancel any previous timer before starting a new one
    _timer?.cancel();

    int remaining = 30;
    _counterSink.add(remaining);
    _percentSink.add(remaining / 30);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          remaining--;
      if (remaining >= 0) {
        _counterSink.add(remaining);
        _percentSink.add(remaining / 30);
      }
      if (remaining <= 0) {
        timer.cancel();
        onNextButtonPressed();
      }
    });
  }

  void onNextButtonPressed() {
    // stop previous timer before moving to next question
    _timer?.cancel();

    currentQuestionIndex++;
    if (currentQuestionIndex < questionsCount) {
      _questionSink.add(questionsList[currentQuestionIndex]);
      _selectedIndexSink.add(-1);
      _currentQuestionIndexSink.add(currentQuestionIndex + 1);
      print(currentQuestionIndex);
      restartCounter(); // start fresh counter
    } else {
      // Handle the case when there are no more questions
    }
    print(currentQuestionIndex);
  }

  List<Question> getQuestionsList() {
    // Make a copy of the original list to avoid mutating it directly
    final questions = List<Question>.from(QuestionData().questions);

    // Shuffle it in place
    questions.shuffle();

    // Take 'count' random items
    return questions.take(questionsCount).toList();
  }

  void dispose() {
    _timer?.cancel();
    _selectedIndexStreamController.close();
    _percentStreamController.close();
    _counterStreamController.close();
    _questionStreamController.close();
  }
}
