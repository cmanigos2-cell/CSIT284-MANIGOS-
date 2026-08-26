import 'package:flutter/material.dart';
import 'package:flutter_application_1/dice_roller.dart';
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
            child: DiceRoller()
              ),
             ),
            ),
          ),
        );
}