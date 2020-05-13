import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [

            Color(0xFFFC5C7D),
            Color(0xFF6A82FB)
            
          ]
        )
      ),


      child: Center(child: Text('HomePage')),

    );
  }
}

