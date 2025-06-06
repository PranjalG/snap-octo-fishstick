part of 'counter_page_bloc.dart';

abstract class CounterPageState {
  final int value;
  CounterPageState(this.value);
}

class CounterPageInitial extends CounterPageState {
  CounterPageInitial() : super(0);
}

class CounterPageValue extends CounterPageState {
  CounterPageValue(int value): super(value);
}
