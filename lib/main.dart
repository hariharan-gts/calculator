import 'package:flutter/material.dart';
import 'CalcButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  CalcApp({Key? key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void evaluation(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  void Clear(String text) {
    setState(() {
      _history = _expression;
      _expression = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
          backgroundColor: Color(0xFF283637),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  _history,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(fontSize: 24),
                    color: Color(0xFF545F61),
                  ),
                ),
                alignment: Alignment(1, 1),
              ),
              Container(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  _expression,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(fontSize: 48),
                    color: Colors.white,
                  ),
                ),
                alignment: Alignment(1, 1),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: 'AC',
                    fillColur: 0xFF6C807F,
                    Callback: allClear,
                  ),
                  CalcButton(
                    text: 'C',
                    fillColur: 0xFF6C807F,
                    Callback: Clear,
                  ),
                  CalcButton(
                      text: '%',
                      fillColur: 0xFFFFFFFF,
                      Callback: numClick,
                      textColour: 0xFF65BDAC),
                  CalcButton(
                    text: '/',
                    fillColur: 0xFFFFFFFF,
                    Callback: numClick,
                    textColour: 0xFF65BDAC,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '7',
                    textSize: 24,
                    Callback: numClick,
                  ),
                  CalcButton(
                    text: '8',
                    Callback: numClick,
                  ),
                  CalcButton(
                    text: '9',
                    Callback: numClick,
                  ),
                  CalcButton(
                    text: '+',
                    Callback: numClick,
                    fillColur: 0xFFFFFFFF,
                    textColour: 0xFF65BDAC,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '4',
                    Callback: numClick,
                  ),
                  CalcButton(
                    text: '5',
                    Callback: numClick,
                  ),
                  CalcButton(
                    text: '6',
                    Callback: numClick,
                  ),
                  CalcButton(
                    text: '-',
                    fillColur: 0xFFFFFFFF,
                    Callback: numClick,
                    textColour: 0xFF65BDAC,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '1',
                    Callback: numClick,
                  ),
                  CalcButton(
                    text: '2',
                    Callback: numClick,
                  ),
                  CalcButton(
                    text: '3',
                    Callback: numClick,
                  ),
                  CalcButton(
                    text: '*',
                    Callback: numClick,
                    fillColur: 0xFFFFFFFF,
                    textColour: 0xFF65BDAC,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '.',
                    Callback: numClick,
                    textSize: 24,
                  ),
                  CalcButton(
                    text: '0',
                    Callback: numClick,
                  ),
                  CalcButton(
                    text: '00',
                    textSize: 26,
                    Callback: numClick,
                  ),
                  CalcButton(
                    text: '=',
                    Callback: evaluation,
                    fillColur: 0xFFFFFFFF,
                    textColour: 0xFF65BDAC,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
