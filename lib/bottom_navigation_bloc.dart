import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  @override
  BottomNavigationState get initialState => InitialBottomNavigationState();

  @override
  Stream<BottomNavigationState> mapEventToState(
    BottomNavigationEvent event,
  ) async* {
    if(event is AppStarted){
      yield InitialBottomNavigationState();
    }

    else if(event is TransitionEvent){
      yield TransitionState(index:event.index);
    }

    else if(event is CartTransition){
      yield CartState(openCart:event.openCart);
    }

  }
}
