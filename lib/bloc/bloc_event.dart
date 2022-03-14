abstract class BlocEvent {}

class BlocEventMediaFetch extends BlocEvent {
  @override
  String toString() => 'BlocEventMediaFetch';
}

class BlocEventValidateFetch extends BlocEvent {
  @override
  String toString() => 'BlocEventValidateFetch';
}

class BlocEventCategoryFetch extends BlocEvent {
  @override
  String toString() => 'BlocEventCategoryFetch';
}

class BlocEventRecentFetch extends BlocEvent {
  @override
  String toString() => 'BlocEventRecentFetch';
}

class BlocEventSameCategoryFetch extends BlocEvent {
  final String category;
  BlocEventSameCategoryFetch({required this.category});
  @override
  String toString() => 'BlocEventSameCategoryFetch';
}
