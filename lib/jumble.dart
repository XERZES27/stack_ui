import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackui/UI/AccountPage.dart';
import 'package:stackui/UI/CategoryPage.dart';
import 'package:stackui/UI/HomePage.dart';
import 'package:stackui/bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class jumble extends StatefulWidget {
  @override
  _jumbleState createState() => _jumbleState();
}

class _jumbleState extends State<jumble> {
  BottomNavigationBloc _bottomNavigationBloc;
  int index;
  bool openCart = false;
  bool setTimer = false;
  bool allowTransition = true;
  int horizontalDragBuildUp=0;
  int verticalDragBuildUp=0;

  void callTransition(int index) {
    _bottomNavigationBloc.add(TransitionEvent(index: index));
  }

  void setResetTimer(){
    Timer(Duration(seconds: 1), () {
      allowTransition = true;

    });

  }

  @override
  void initState() {
    super.initState();
    _bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenwWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
      if (state is TransitionState) {
        index = state.index;
      } else if (state is InitialBottomNavigationState) {
        index = state.index;
      } else if (state is CartState) {
        openCart = state.openCart;
      }

      return Scaffold(
        body: Builder(
            builder: (context) => Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      width: screenwWidth,
                      top: openCart
                          ? 0-(screenHeight*0.10)
                          : 0,
                      child: GestureDetector(

                        onHorizontalDragUpdate: (dragDetails){
                          double draggedScreenPercentageY =
                              dragDetails.globalPosition.dy / screenHeight;
                          double draggedScreenPercentageX =
                              dragDetails.globalPosition.dx / screenwWidth;

                          if(draggedScreenPercentageX < 0.4 && draggedScreenPercentageX > 0.1){
                                if(dragDetails.delta.dx > 3){
                                  if(index != 0){
                                    if(allowTransition){
                                    allowTransition = false;
                                    setResetTimer();
                                      _bottomNavigationBloc.add(TransitionEvent(index: index-1));}
//
                                  }
                                }

                          }
                          else if( draggedScreenPercentageX >0.6 && draggedScreenPercentageX < 0.9){
                            if(dragDetails.delta.dx < -3){
                              if(index != 2){
                                if(allowTransition){
                                allowTransition = false;
                                setResetTimer();
                                _bottomNavigationBloc.add(TransitionEvent(index: index+1));}
//
                              }

                            }

                          }


                        },



                        onVerticalDragUpdate: (dragDetails) {
                          double draggedScreenPercentageY =
                              dragDetails.globalPosition.dy / screenHeight;

                          if (draggedScreenPercentageY > 0.8) {
                            if (dragDetails.delta.dy < -2) {
                              _bottomNavigationBloc
                                  .add(CartTransition(openCart: true));
                            }
                          }

                          if(openCart){
                            if(dragDetails.delta.dy>2){
                              _bottomNavigationBloc
                                  .add(CartTransition(openCart: false));

                            }
                          }
//                      print("horizontal position"+"${dragDetails.delta.dx}");
//                      print("vertical position"+"${dragDetails.delta.dy}");
                        },
                        onTap: () {
                          if (openCart) {
                            _bottomNavigationBloc
                                .add(CartTransition(openCart: false));
                          }
                        },
                        child: Column(
                          children: <Widget>[
                            SizedBox.fromSize(
                              size: Size(MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height * 0.90),
                              child: IndexedStack(
                                index: index,
                                children: <Widget>[
                                  HomePage(),
                                  CategoryPage(),
                                  AccountPage()
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                SizedBox.fromSize(
                                    size: Size(
                                        MediaQuery.of(context).size.width / 3,
                                        MediaQuery.of(context).size.height *
                                            0.10),
                                    child: Material(
                                      type: MaterialType.card,
                                      color: Colors.white,
                                      elevation: 3,
                                      child: IconButton(
                                        onPressed: () {
                                          callTransition(0);
                                        },
                                        icon: Icon(
                                          Icons.home,
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                    )),
                                SizedBox.fromSize(
                                    size: Size(
                                        MediaQuery.of(context).size.width / 3,
                                        MediaQuery.of(context).size.height *
                                            0.10),
                                    child: Material(
                                      type: MaterialType.card,
                                      color: Colors.white,
                                      elevation: 3,
                                      child: IconButton(
                                        onPressed: () {
                                          callTransition(1);
                                        },
                                        icon: Icon(
                                          Icons.category,
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                    )),
                                SizedBox.fromSize(
                                    size: Size(
                                        MediaQuery.of(context).size.width / 3,
                                        MediaQuery.of(context).size.height *
                                            0.10),
                                    child: Material(
                                      type: MaterialType.card,
                                      color: Colors.white,
                                      elevation: 3,
                                      child: IconButton(
                                        onPressed: () {
                                          callTransition(2);
                                        },
                                        icon: Icon(
                                          Icons.account_circle,
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    AnimatedPositioned(

                      height: screenHeight / 10,
                      width: screenwWidth,
                      top: openCart
                          ? screenHeight - (screenHeight / 10)
                          : screenHeight,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(2, 10, 2, 5),


                        child: Material(
                          type: MaterialType.card,

                          color: Colors.white24,

//                          borderRadius: BorderRadius.only(topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                          elevation: 10,
                          shadowColor: Colors.black,

                            child: Center(
                              child: Text(
                                  "Cart Here",
                                  style: TextStyle(
                                      fontFamily: 'KaushanScript-Regular',
                                      fontSize: 25,
                                      color: Colors.yellowAccent
                                  )
                              ),
                            ),
                        ),
                      ),
                      duration: Duration(milliseconds: 500),
                    )
                  ],
                )),
      );
    });
  }
}
