import 'dart:math'; // 18.2 (a)

// 18.1

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi; // 18.4

  CalculatorBrain({this.height, this.weight});

  // 18.2 (b)
  String calculateBMI() {
    // divide weight by -> convert height to m and square it
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1); // 18.2 (c)
  }

  // 18.3
  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  // 18.5
  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You are too fat! Start excercising you lazy fart!';
    } else if (_bmi > 18.5) {
      return 'Your BMI is in the normal range - keep it there!';
    } else {
      return 'Are you anorexic?? Start eating, stop puking, moron!';
    }
  }
}
