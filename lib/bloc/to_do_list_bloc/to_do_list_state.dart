part of 'to_do_list_bloc.dart';

final class ToDoListState extends Equatable {
  const ToDoListState({
    this.taskList,
  });

  final Map<String, bool>? taskList;

  ToDoListState copyWith({
    Map<String, bool>? taskList,
    bool? isDone,
  }) {
    return ToDoListState(
      taskList: taskList ?? this.taskList,
    );
  }

  @override
  List<Object?> get props => [
        taskList,
      ];
}

final class ToDoListInitial extends ToDoListState {
  ToDoListInitial({required super.taskList});
}
