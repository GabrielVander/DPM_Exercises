import 'package:dpm_exercises/models/exercise.dart';
import 'package:dpm_exercises/utils/input_utils.dart';

class Exercise2 extends Exercise {
  const Exercise2()
      : super(
          2,
          'Even or Odd?',
          "Ask the user to type a number. Display whether the inputted number is either even or odd",
        );

  @override
  void execute() {
    super.menu();
    print('');
    int userNumber = getNonEmptyIntegerInput(
        displayMessage: 'Please choose a number',
        onEmptyInputErrorMessage: 'You have to type something\n',
        onUnparseableInputErrorMessage: 'That\'s not right...\n');
    result(userNumber);
  }

  void result(int userNumber) {
    print('That\'s an ${userNumber.isEven ? 'Even' : 'Odd'} number!\n');
  }
}
