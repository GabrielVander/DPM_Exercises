import 'package:dpm_exercises/models/exercise.dart';
import 'package:dpm_exercises/utils/input_utils.dart';

class Exercise3 extends Exercise {
  const Exercise3()
      : super(
          3,
          'Less than 5',
          "Write a program that:\n- Asks the user how many numbers they want to write\n- Allow the user to input the desired numbers\n- Display all numbers that are less than 5",
        );

  @override
  void execute() {
    _menu();
    print('');
    final int userInputAmount = getUserInputAmount();
    final List<int> userInputs = getUserInputs(userInputAmount);
    result(userInputs);
  }

  int getUserInputAmount() {
    while (true) {
      final int input = getNonEmptyIntegerInput(
        displayMessage: 'Please tell how many numbers you\'d like to input',
        onEmptyInputErrorMessage: 'You have to type something\n',
        onUnparseableInputErrorMessage: 'That\'s not right...\n',
      );
      if (input > 0) {
        return input;
      }
      print('Please, choose a positive number\n');
    }
  }

  void _menu() {
    print('$identifier - $title');
    print(description);
  }

  List<int> getUserInputs(int userInputAmount) {
    final List<int> inputs = [];

    for (int i = 0; i < userInputAmount; i++) {
      int number = getNonEmptyIntegerInput(
        displayMessage: 'Type a number',
        onEmptyInputErrorMessage: 'Please type something\n',
        onUnparseableInputErrorMessage: 'We need a number, not that!\n',
      );
      inputs.add(number);
    }

    return inputs;
  }

  void result(List<int> userInputs) {
    print('\nYou\'ve inputted the following numbers:');
    print(userInputs);
    final List<int> numbersHigherThanFive =
        userInputs.where((number) => number > 5).toList();
    print('Of which, these are bigger than 5:');
    print(numbersHigherThanFive.isEmpty ? 'None!' : numbersHigherThanFive);
  }
}
