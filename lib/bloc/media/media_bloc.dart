import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okonect/bloc/bloc_event.dart';
import 'package:okonect/bloc/block_state.dart';
import 'package:okonect/providers/dataProvider.dart';
import 'dart:core';

class MediaBloc extends Bloc<BlocEvent, BlocState> {
  MediaBloc() : super(BlocStateUninitialized());
  DataApiProvider _apiProvider = new DataApiProvider();

  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is BlocEventMediaFetch) {
      yield BlocStateLoading();
      try {
        final data = _apiProvider.fetchAllMedia();
        yield BlocStateLoaded(data: data);
      } catch (e) {
        yield BlocStateError(error: e);
      }
    }
  }
}
