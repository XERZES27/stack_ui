import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackui/jumble.dart';
import 'bottom_navigation_bloc.dart';
import 'bottom_navigation_event.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context)=>BottomNavigationBloc()..add(AppStarted()),
        child: jumble(),


      ),
    );
  }
}


