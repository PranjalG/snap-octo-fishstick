part of 'to_do_list_bloc.dart';

class ToDoListEvent extends Equatable {
  const ToDoListEvent();

  @override
  List<Object> get props => [];
}

class ToDoListAddTask extends ToDoListEvent {}

class ToDoListRemoveTask extends ToDoListEvent {}