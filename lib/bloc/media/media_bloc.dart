import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okonect/bloc/bloc_event.dart';
import 'package:okonect/bloc/block_state.dart';

class MediaBloc extends Bloc<BlocEvent, BlocState> {
  MediaBloc() : super(BlocStateUninitialized());
  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is BlocEventMediaFetch) {
      yield BlocStateLoading();
      
    }
  }
}
