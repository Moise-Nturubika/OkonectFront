abstract class BlocEvent {}

class BlocEventMediaFetch extends BlocEvent {
  @override
  String toString() => 'BlocEventMediaFetch';
}

class BlocEventValidateFetch extends BlocEvent {
  @override
  String toString() => 'BlocEventValidateFetch';
}
