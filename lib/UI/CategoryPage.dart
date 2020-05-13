import 'package:flutter/material.dart';



class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [

                Color(0xFF330867),
                Color(0xFF30cfd0)

              ]
          )
      ),

      child: Center(child: Text('CategoryPage')),

    );
  }
}
