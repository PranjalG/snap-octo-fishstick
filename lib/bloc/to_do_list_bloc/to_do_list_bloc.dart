import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'to_do_list_event.dart';
part 'to_do_list_state.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  ToDoListBloc() : super(ToDoListInitial(taskList: null)) {
    on<ToDoListEvent>((event, emit) {});

    on<ToDoListAddTask>((event, emit) {
      print(event);
      state.taskList!['value'] = true;
      print(state);
      emit(ToDoListState());
    });
  }
}
