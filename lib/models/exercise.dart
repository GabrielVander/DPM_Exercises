abstract class Exercise {
  final int identifier;
  final String title;
  final String description;

  const Exercise(this.identifier, this.title, this.description);

  void execute();
}
