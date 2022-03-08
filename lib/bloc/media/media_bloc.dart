import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okonect/bloc/bloc_event.dart';
import 'package:okonect/bloc/block_state.dart';
import 'package:okonect/providers/dataProvider.dart';
import 'dart:core';

class MediaBloc extends Bloc<BlocEvent, BlocState> {
  MediaBloc() : super(BlocStateUninitialized()) {
    on<BlocEventMediaFetch>(_onBlocEventMediaFetch);
  }
  DataApiProvider _apiProvider = new DataApiProvider();

  void _onBlocEventMediaFetch(BlocEvent event, Emitter<BlocState> state) {
    emit(BlocStateLoading());
    try {
      final data = _apiProvider.fetchAllMedia();
      emit(BlocStateLoaded(data: data));
    } catch (e) {
      emit(BlocStateError(error: e));
    }
  }

  // @override
  // Stream<BlocState> mapEventToState(BlocEvent event) async* {
  //   if (event is BlocEventMediaFetch) {

  //   }
  // }
}
