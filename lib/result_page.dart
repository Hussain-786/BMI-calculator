import 'constants.dart';
import 'reusableCard.dart';
import 'package:flutter/material.dart';
import 'Bottom_button.dart';

class results extends StatelessWidget {
  final String bmiResult;
  final String bmiString;
  final String interpretation;
  results({@required this.bmiResult, @required this.bmiString, @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Your Result :',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 40.0,
              ),
            ),
          ),
          Expanded(
            child: reusableCard(
              containerColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    bmiString,
                    style:  kResultText,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    bmiResult,
                    style: kNumberStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    interpretation,
                    style: kBodyResult,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(text: 'RE-CALCULATE',OnTap: (){
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}