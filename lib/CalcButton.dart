import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String? text;
  final int? textColour;
  final int? fillColur;
  final double? textSize;
  final Function? Callback;
  // ignore: use_key_in_widget_constructors
  const CalcButton(
      {this.text,
      this.fillColur,
      this.textColour = 0xFFFFFFFF,
      this.textSize = 28,
      this.Callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
          width: 65,
          height: 65,
          child: FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: Text(
              text!,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                fontSize: 20,
              )),
            ),
            onPressed: () {
              Callback!(text);
            },
            color: fillColur != null ? Color(fillColur!) : null,
            textColor: Color(textColour!),
          )),
    );
  }
}
