import 'package:flutter/material.dart';
import 'package:xo_game/BoardButton.dart';
import 'package:xo_game/XOBoard.dart';

void main() {
  runApp(XoGame());
}

class XoGame extends StatelessWidget {
  @override
  Widget build(BuildContext context){
 return MaterialApp(
   title: 'Simple XO',
debugShowCheckedModeBanner:false ,

home: Scaffold(

  appBar: AppBar(title: Text('XO Game',)),
  body: XOBoard(),

),

 );
  }
// This widget is the root of your application.
}