import 'package:quiz_app/question.dart';

class Brain {
  int _questionNum = 0;
  List<Question> _questionBank = [
    Question(q: 'آیا فلاتر یک زبان برنامه نویسی است؟', a: true),
    Question(q: 'آیا یادگیری فلاتر سخت است؟', a: false),
    Question(q: 'بهترین زبان برنامه نویسی فلاتر است ؟', a: true),
    Question(q: 'آیا کاربردی ترین پلت فرم برنامه نویسی فلاتر است؟', a: true),
  ];

  void nextQuestion() {
    if (_questionNum > _questionBank.length - 1) {
      _questionNum++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNum].question;
  }

  bool correctAnswer() {
    return _questionBank[_questionNum].answer;
  }

  bool isFinished() {
    if (_questionNum >= _questionBank.length - 1) {
      reset();
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNum = 0;
  }
}
