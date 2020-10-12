import 'package:flutter/material.dart';
import 'result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'boxContent.dart';
import 'constants.dart';
import 'Bottom_button.dart';
import 'bmi_brain.dart';

enum Gender {
  male,
  female,
}

int height = 150;
int weight = 40;
int age = 15;

class bmiCalculator extends StatefulWidget {
  @override
  _bmiCalculatorState createState() => _bmiCalculatorState();
}

class _bmiCalculatorState extends State<bmiCalculator> {
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          appBar: AppBar(
            title: Center(
               child: Text(
               'BMI CALCULATOR'
              ),
            ),
          ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: reusableCard(
                    selectedGender == Gender.male? containerColor : inactiveColor,
                    boxContent(
                      boxIcon: FontAwesomeIcons.mars,
                      boxText: 'MALE',
                    ),  
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: reusableCard(
                      selectedGender == Gender.female? containerColor: inactiveColor,
                      boxContent(
                        boxIcon: FontAwesomeIcons.venus,
                        boxText: 'FEMALE',
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
        Expanded(
          child: reusableCard(
            containerColor,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: labelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberStyle,
                    ),
                    Text(
                      'cm',
                      style: labelStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x15EB1555)
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 0,
                    max: 300,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                  child:reusableCard(
                    containerColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberStyle,
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          rawButton(
                            icon: FontAwesomeIcons.minus,
                            colour: Colors.white,
                            OnPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          rawButton(
                            icon: FontAwesomeIcons.plus,
                            colour: Colors.white,
                            OnPressed: (){
                              setState(() {
                                weight++;
                              });
                            }
                          ),
                        ],
                      ),
                      ],
                    ),
                  ),
              ),
              Expanded(
                  child: reusableCard(
                    containerColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          rawButton(
                            icon: FontAwesomeIcons.minus,
                            colour: Colors.white,
                            OnPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          rawButton(
                            icon: FontAwesomeIcons.plus,
                            colour: Colors.white,
                            OnPressed: (){
                              setState(() {
                                age++;
                              });
                            }
                          ),
                        ],
                      ),
                    ],
                    ),
                  ),
              ),
            ],
          ),
        ),
        BottomButton(text: 'CALCULATE',OnTap: (){
          CalculatorBrain brain = CalculatorBrain(weight: weight, height: height);

          Navigator.push(
          context, MaterialPageRoute(builder: (context) => results(
            bmiResult: brain.calculateBmi(), 
            bmiString: brain.calculateText(),
            interpretation: brain.getInterpretation()),
        ),
      );
      },),
      ],
     ),
    ),
   );
  }
}

class rawButton extends StatelessWidget {
  final IconData icon;
  final Color colour;
  final Function OnPressed;
  rawButton({this.icon,this.colour,this.OnPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon,color: colour,),
      onPressed: OnPressed,
      fillColor: containerText,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 46.0,
        height: 46.0,
      ),
    );
  }
}