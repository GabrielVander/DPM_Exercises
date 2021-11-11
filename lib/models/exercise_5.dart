import 'package:dpm_exercises/models/exercise.dart';
import 'package:dpm_exercises/utils/input_utils.dart';

class Exercise5 extends Exercise {
  const Exercise5()
      : super(
          5,
          'Is prime?',
          "Write a program that:\n- Asks the user to input a number\n- Display whether the inputted number is prime or not",
        );

  @override
  void execute() {
    super.menu();
    print('');
    final int userNumber = getNonEmptyIntegerInput(
      displayMessage: 'Type a number\n',
      onEmptyInputErrorMessage: 'Please type something\n',
      onUnparseableInputErrorMessage: 'We require a number\n',
    );
    print('It IS${_isPrime(userNumber) ? '' : ' NOT'} a prime number!');
  }

  bool _isPrime(int userNumber) {
    int numberOfFactors = 0;

    if (userNumber.isEven) {
      return false;
    }

    for (int factor = 1; factor <= userNumber; factor++) {
      if (userNumber % factor == 0) {
        numberOfFactors++;
      }
    }

    return numberOfFactors <= 2;
  }
}
