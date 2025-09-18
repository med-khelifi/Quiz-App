class QuestionAnswerResult {
  final int questionNumber;
  final String question;
  final bool isCorrect;
  final String correctAnswer;
  final String? wrongAnswer;
  QuestionAnswerResult({required this.questionNumber,required this.question,required this.isCorrect,required this.correctAnswer, this.wrongAnswer});
}