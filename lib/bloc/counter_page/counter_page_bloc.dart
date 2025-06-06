import 'package:bloc/bloc.dart';

part 'counter_page_event.dart';
part 'counter_page_state.dart';

class CounterPageBloc extends Bloc<CounterPageEvent, CounterPageState> {
  CounterPageBloc() : super(CounterPageInitial()) {
    on<CounterPageEvent>((event, emit) {
    });

    on<CounterPageIncrementEvent> ((event, emit) {
      emit(CounterPageValue(state.value + 1));
    });

    on<CounterPageDecrementEvent> ((event, emit) {
      emit(CounterPageValue(state.value - 1));
    });
  }
}
