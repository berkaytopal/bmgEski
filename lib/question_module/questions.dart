import 'answers.dart';

class TestData{
  int _questionIndex=0;

  List<Question> _questionBank= [
    Question(
      questionText: '"const" sabit değerli değişkenleri tutar',
      questionAnswer: true),
    Question(
      questionText: "Her widget'e ait birer paket tanımlamak gerekir",
      questionAnswer: false),
    Question(
      questionText: '"Center" ekrana bastırmak istediğiniz materyali merkeze koyar',
      questionAnswer: true),
    Question(
      questionText: 'İkonların kendine ait bir değişken tanımı bulunmaz',
      questionAnswer: false),
    Question(
      questionText: '"setState" ekrana bastırmak istediğiniz materyali anlık güncel tutar',
      questionAnswer: true),
    Question(
      questionText: '"runSpacing" komutu materyaller arasında dikey boşluk bırakılmasını sağlar', 
      questionAnswer: true) 
  ];

  String getQuestionText(){
    return _questionBank[_questionIndex].questionText;
  }
  bool getQuestionAnswer(){
    return _questionBank[_questionIndex].questionAnswer;
  }

  void nextQuestion(){
    if(_questionIndex +1 <= _questionBank.length ){ //.lenght listenin uzunluğunu getiriri.
      _questionIndex++;
    }
  }

  bool isTestDone (){
    if(_questionIndex+1  >= _questionBank.length ){
      return true;
    }else{
      return false;
    }
  }

  void resetTest(){
    _questionIndex=0;
  }
}