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
            child: column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Image.asset(width: 200, 'assets/dice-images/dice-2.png')
            Textbutton(onPressed: () {}, child: Text(
              style:TextStyle(
                
              )
            "Roll Dice"
            )
            ),
              ],
            
            ),
              ),
             ),
            ),
          ),
        );
}