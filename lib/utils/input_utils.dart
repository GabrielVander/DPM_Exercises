import 'dart:io';

String getNonEmptyInput({
  required String displayMessage,
  required String onEmptyInputErrorMessage,
}) {
  while (true) {
    print(displayMessage);
    final String? input = stdin.readLineSync();
    if (input != null && input != '') {
      return input;
    }
    print(onEmptyInputErrorMessage);
  }
}

int getNonEmptyIntegerInput({
  required String displayMessage,
  required String onEmptyInputErrorMessage,
  required String onUnparseableInputErrorMessage,
}) {
  while (true) {
    final String input = getNonEmptyInput(
      displayMessage: displayMessage,
      onEmptyInputErrorMessage: onEmptyInputErrorMessage,
    );
    final int? parsedInput = int.tryParse(input);
    if (parsedInput != null) {
      return parsedInput;
    }
    print(onUnparseableInputErrorMessage);
  }
}
