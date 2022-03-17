import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okonect/bloc/bloc_event.dart';
import 'package:okonect/bloc/block_state.dart';
import 'package:okonect/providers/dataProvider.dart';
import 'dart:core';

class UserBloc extends Bloc<BlocEvent, BlocState> {
  UserBloc() : super(BlocStateUninitialized()) {
    on<BlocEventMediaFetch>(_onBlocEventMediaFetch);
    // on<BlocEventCategoryFetch>(_onBlocEventCategoryFetch);
    // on<BlocEventRecentFetch>(_onBlocEventRecentFetch);
    // on<BlocEventSameCategoryFetch>(_onBlocEventSameCategoryFetch);
  }
  DataApiProvider _apiProvider = new DataApiProvider();

  void _onBlocEventMediaFetch(event, emit) async {
    emit(BlocStateLoading());
    try {
      final data = await _apiProvider.fetchMediaByClient(idClient: event.data);
      emit(BlocStateLoaded(data: data));
    } catch (e) {
      print("Error ====> ${e.toString()}");
      emit(BlocStateError(error: e));
    }
  }

  // void _onBlocEventSameQuality(event, emit) async {
  //   emit(BlocStateLoading());
  //   try {} catch (e) {
  //     emit(BlocStateError(error: e.toString()));
  //   }
  // }
}
