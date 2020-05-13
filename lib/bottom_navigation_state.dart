import 'package:equatable/equatable.dart';


abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();


}

class InitialBottomNavigationState extends BottomNavigationState {
  final int index = 0;
  final bool openCart = true;
  const InitialBottomNavigationState();

  @override
  List<Object> get props => [this.index,this.openCart];


}



class TransitionState extends BottomNavigationState{
  final int index;
  const TransitionState({this.index});

  @override
  List<Object> get props => [this.index];

}

class CartState extends BottomNavigationState{
  final openCart;
  const CartState({this.openCart});

  @override
  List<Object> get props => [this.openCart];

}
