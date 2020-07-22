class Todos {
  final String todo;
  bool isDone;

  Todos({
    this.todo,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
