import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

}

class AppStarted extends BottomNavigationEvent{

  @override
  List<Object> get props => [];
}


class TransitionEvent extends BottomNavigationEvent{
  final int index;

  const TransitionEvent({this.index});

  @override
  List<Object> get props => [this.index];



}


class CartTransition extends BottomNavigationEvent{
  final openCart;
  const CartTransition({this.openCart});

  @override
  List<Object> get props => [this.openCart];


}
