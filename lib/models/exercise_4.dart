import 'package:dpm_exercises/models/exercise.dart';
import 'package:dpm_exercises/utils/input_utils.dart';

class Exercise4 extends Exercise {
  static const _listAmount = 2;

  const Exercise4()
      : super(
          4,
          'Common elements',
          "Write a program that:\n- Asks the user how many numbers they want to write for each list\n- Allow the user to input the desired numbers\n- Display all numbers that are common to both lists",
        );

  @override
  void execute() {
    super.menu();
    print('');
    final List<List<int>> lists = _getUserInputs();
    _result(firstList: lists[0], secondList: lists[1]);
  }

  List<List<int>> _getUserInputs() {
    List<List<int>> lists = [];

    for (int i = 1; i <= _listAmount; i++) {
      int listAmount = getNonEmptyIntegerInput(
        displayMessage: 'How many items do you want to add to list nº$i?',
        onEmptyInputErrorMessage: 'Please type something\n',
        onUnparseableInputErrorMessage: 'That\'s not right...\n',
      );

      List<int> builtList = _buildList(listAmount);
      lists.add(builtList);
    }

    return lists;
  }

  List<int> _buildList(int listAmount) {
    List<int> elements = [];

    for (int i = 0; i < listAmount; i++) {
      int element = getNonEmptyIntegerInput(
        displayMessage: 'Type a number',
        onEmptyInputErrorMessage: 'Type something!\n',
        onUnparseableInputErrorMessage: 'I said number!\n',
      );
      elements.add(element);
    }

    return elements;
  }

  void _result({required List<int> firstList, required List<int> secondList}) {
    print('You\'ve inputted the following:');
    print('First list: $firstList');
    print('Second list: $secondList');
    print('');
    List<int> commonElements =
        firstList.where((element) => secondList.contains(element)).toList();
    print('The following elements are common between both lists:');
    print(commonElements.isEmpty ? 'None!' : commonElements);
  }
}
