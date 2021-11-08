import 'package:dpm_exercises/models/exercise.dart';
import 'package:dpm_exercises/models/exercise_1.dart';
import 'package:dpm_exercises/models/exercise_2.dart';
import 'package:dpm_exercises/utils/input_utils.dart';

import 'models/exercise_3.dart';

const numberOfDashes = 70;
const List<Exercise> exercises = [
  Exercise1(),
  Exercise2(),
  Exercise3(),
];

void start() {
  while (true) {
    print('');
    print('-' * numberOfDashes);
    mainMenu();
    print('-' * numberOfDashes);
  }
}

Exercise? getExercise(int exerciseIdentifier) {
  if (exercises.any((exercise) => exercise.identifier == exerciseIdentifier)) {
    return exercises
        .singleWhere((exercise) => exercise.identifier == exerciseIdentifier);
  }
  return null;
}

Exercise exerciseSelection() {
  bool isExerciseChoiceValid = false;

  do {
    int exerciseChoice = getNonEmptyIntegerInput(
      displayMessage: 'Which one would you like to execute?\n',
      onEmptyInputErrorMessage: 'You must choose an exercise to execute\n',
      onUnparseableInputErrorMessage:
          'That\'s not right... Please choose one of the displayed numbers\n',
    );
    final Exercise? chosenExercise = getExercise(exerciseChoice);

    if (chosenExercise != null) {
      isExerciseChoiceValid = true;
      return chosenExercise;
    }

    print('Unknown choice. Please choose one of the displayed numbers\n');
  } while (!isExerciseChoiceValid);
  throw Exception('Something went wrong');
}

void exercisesDisplay() {
  for (var exercise in exercises) {
    print('${exercise.identifier} - ${exercise.title}');
  }
}

void mainMenu() {
  print('\t' * 7 + 'DPM - Exercises');
  print('There are ${exercises.length} exercises available to test:');
  print('');
  exercisesDisplay();
  print('');
  final Exercise chosenExercise = exerciseSelection();
  chosenExercise.execute();
}
