import 'package:flutter/material.dart';
import 'questions.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blueGrey[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> elections=[];

  TestData test_1= TestData();

  void buttonFunction(bool choosenButton){

    if(test_1.isTestDone()==true){

      showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Testi bitirdiniz."),
          //content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Başa dön"),
              onPressed: () {

                Navigator.of(context).pop(); // ekrandaki widgeti kapatır.

                setState(() {
                test_1.resetTest();
                elections=[];
                });
                
              },
            ),
            new FlatButton(
              child: new Text("kapat"),
              onPressed: () {

                Navigator.of(context).pop(); // ekrandaki widgeti kapatır.

                setState(() {
                test_1.resetTest();
                elections=[];
                });
                
              },
            ),
          ],
        );
      },
    );

    
      

    }else{   
     setState(() {
        test_1.getQuestionAnswer()==choosenButton
        ? elections.add(trueIcon)
        : elections.add(falseIcon);                                                     
       test_1.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(


          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.green[300] ,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          //runSpacing: 12, // dikey boşluk bırakır.
          spacing: 12,   // yatay boşluk bırakır.
          children: elections,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: ( ) {
                            buttonFunction(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {  
                            buttonFunction(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}


const Icon trueIcon = Icon( Icons.mood , color: Colors.green,); //const(sabit) yaptık çünkü bir daha asla değişmeyecek bir değişken tanımladık.
const Icon falseIcon = Icon( Icons.mood_bad , color: Colors.red,);