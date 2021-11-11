import 'package:dpm_exercises/models/exercise.dart';
import 'package:dpm_exercises/utils/input_utils.dart';

class Exercise1 extends Exercise {
  static const int _targetAge = 100;

  const Exercise1()
      : super(
            1,
            'How long until $_targetAge years',
            "Create a program that prompts its user for their name and age. "
                "Display how many years remaining until the user "
                "is $_targetAge years old");

  @override
  void execute() {
    super.menu();
    print('');
    final String userName = _getUserName();
    int age = _getValidUserAge(userName);
    int remainingYears = _calculateRemainingYears(age);
    _result(userName, age, remainingYears);
  }

  String _getUserName() {
    return getNonEmptyInput(
      displayMessage: 'What\'s your name?\n',
      onEmptyInputErrorMessage: 'Just say any name...  please\n',
    );
  }

  int _getValidUserAge(String userName) {
    while (true) {
      var input = getNonEmptyIntegerInput(
        displayMessage: 'Ok $userName, now what\'s your age?\n',
        onEmptyInputErrorMessage: 'You have to type something...\n',
        onUnparseableInputErrorMessage:
            'Yup, that\'s definitely not right...\n',
      );
      if (input > 0) {
        return input;
      }
      print(
          'Not a real age... don\'t make this harder than it has to... please...\n');
    }
  }

  int _calculateRemainingYears(int age) {
    return _targetAge - age;
  }

  void _result(String userName, int age, int remainingYears) {
    print('');
    if (remainingYears < 0) {
      print(
          'Hey, $userName! You\'re already ${remainingYears.abs()} years past $_targetAge!');
      return;
    }
    if (remainingYears == 0) {
      print('Ha! $userName, you\'re already $_targetAge years old!');
      return;
    }
    print(
        '$userName, you have $remainingYears years remaining until you\'re $_targetAge years old');
  }
}
