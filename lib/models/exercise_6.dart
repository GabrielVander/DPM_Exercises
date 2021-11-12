import 'dart:collection';

import 'package:dpm_exercises/models/exercise.dart';
import 'package:dpm_exercises/utils/input_utils.dart';

class Exercise6 extends Exercise {
  const Exercise6()
      : super(
          6,
          'Birthdays',
          "Write a program that allows the user to input names and their respective birthdays\nThe use must be able to keep inserting new values until they type\"exit\". Then, the user must be able to type a name and see its corresponding birthday",
        );

  @override
  void execute() {
    super.menu();
    print('');
    final Map<String, String> birthdaysByName = _buildDataSet();
    print('');
    _nameSearch(birthdaysByName);
  }

  Map<String, String> _buildDataSet() {
    Map<String, String> birthdays = HashMap();

    while (true) {
      String nameInput = getNonEmptyInput(
        displayMessage: 'Please type a name',
        onEmptyInputErrorMessage: 'You need to type something\n',
      );

      if (nameInput == 'exit') return birthdays;

      String birthdayInput = getNonEmptyInput(
        displayMessage: 'Input $nameInput\'s birthday',
        onEmptyInputErrorMessage: 'Please, type something\n',
      );

      if (birthdayInput == 'exit') return birthdays;

      birthdays[nameInput] = birthdayInput;

      print('');
    }
  }

  void _nameSearch(Map<String, String> birthdaysByName) {
    while (true) {
      String nameInput = getNonEmptyInput(
        displayMessage: 'Please type a name to search for',
        onEmptyInputErrorMessage: 'Please, type something\n',
      );

      if (nameInput == 'exit') return;

      if (birthdaysByName.containsKey(nameInput)) {
        print('$nameInput\'s birthday is on ${birthdaysByName[nameInput]}!\n');
        continue;
      }
      print('No entry for $nameInput!\n');
    }
  }
}
