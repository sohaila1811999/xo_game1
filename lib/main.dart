import 'package:flutter/material.dart';

void main() {
  runApp(XoGame());
}

class XoGame extends StatelessWidget {
  @override
  Widget build(BuildContext context){
 return MaterialApp(
   title: 'Simple XO',


home: Scaffold(
  appBar: AppBar(title: Text('XO Game',)),
  body: XoGame(),

),

 );
  }
// This widget is the root of your application.
}