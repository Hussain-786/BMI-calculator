class  CalculatorBrain {
  final height;
  final weight;
  double _bmi;
  CalculatorBrain({this.weight, this.height});

  String calculateBmi(){
    _bmi = weight/(height/100 * height/100);
    return _bmi.toStringAsFixed(2);
  }

  String calculateText(){
    if(_bmi >= 25){
      return 'OVERWEIGHT';
    }else if(_bmi > 18.5){
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'You have a higher than normal body weight. Try to exercise more. ';
    }else if(_bmi >= 18.5){
      return 'You have a normal boday weight, Good job! ';
    }else{
      return 'You have a lower than normal body weight. You can eat a bit more. ';
    }
  }
}