import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okonect/bloc/bloc_event.dart';
import 'package:okonect/bloc/block_state.dart';
import 'package:okonect/providers/dataProvider.dart';
import 'dart:core';

class MediaBloc extends Bloc<BlocEvent, BlocState> {
  MediaBloc() : super(BlocStateUninitialized()) {
    on<BlocEventMediaFetch>(_onBlocEventMediaFetch);
    on<BlocEventCategoryFetch>(_onBlocEventCategoryFetch);
    on<BlocEventRecentFetch>(_onBlocEventRecentFetch);
  }
  DataApiProvider _apiProvider = new DataApiProvider();

  void _onBlocEventMediaFetch(event, emit) async {
    emit(BlocStateLoading());
    try {
      final data = await _apiProvider.fetchAllMedia();
      emit(BlocStateLoaded(data: data));
    } catch (e) {
      print("Error ====> ${e.toString()}");
      emit(BlocStateError(error: e));
    }
  }

  void _onBlocEventCategoryFetch(event, emit) async {
    emit(BlocStateLoading());
    try {
      final data = await _apiProvider.fetchAllCategory();
      emit(BlocStateLoaded(data: data));
    } catch (e) {
      print("Error ====> ${e.toString()}");
      emit(BlocStateError(error: e));
    }
  }

  void _onBlocEventRecentFetch(event, emit) async {
    emit(BlocStateLoading());
    try {
      final data = await _apiProvider.fetchRecentMedia();
      emit(BlocStateLoaded(data: data));
    } catch (e) {
      print("Error ====> ${e.toString()}");
      emit(BlocStateError(error: e));
    }
  }

  // @override
  // Stream<BlocState> mapEventToState(BlocEvent event) async* {
  //   if (event is BlocEventMediaFetch) {

  //   }
  // }
}
