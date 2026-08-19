import 'package:flutter/material.dart';

void main (){
  runApp(
    MaterialApp(
      home: Scaffold(
        
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.indigo,
              Colors.white12,
            ])
          ),
          child: Center(
            child: Text("Hello World"))),
            ),
          ),
        );
}