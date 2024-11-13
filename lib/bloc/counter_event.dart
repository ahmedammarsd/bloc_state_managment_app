import 'package:bloc_state_management_app/utils/class_provider.dart';

class CounterEvent extends MethodsApis {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterToZero extends CounterEvent {}
