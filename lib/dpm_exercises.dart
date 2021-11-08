import 'dart:io';

import 'package:dpm_exercises/models/exercise.dart';
import 'package:dpm_exercises/models/exercise_1.dart';

const numberOfDashes = 70;
const List<Exercise> exercises = [
  Exercise1(),
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
  String? input;
  bool isExerciseChoiceValid = false;

  do {
    print('Which one would you like to execute?\n');
    input = stdin.readLineSync();
    int? exerciseChoice = getValidatedExerciseChoice(input);
    if (exerciseChoice != null) {
      final Exercise? chosenExercise = getExercise(exerciseChoice);

      if (chosenExercise != null) {
        isExerciseChoiceValid = true;
        return chosenExercise;
      }

      print('Unknown choice. Please choose one of the displayed numbers');
    }
  } while (!isExerciseChoiceValid);
  throw Exception('Something went wrong');
}

int? getValidatedExerciseChoice(String? input) {
  if (input == null || input == '') {
    print('You must choose an exercise to execute\n');
    return null;
  }
  final int? parsedChoice = int.tryParse(input);
  if (parsedChoice == null) {
    print('That\'s not right... Please choose one of the displayed numbers\n');
    return null;
  }
  return parsedChoice;
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
