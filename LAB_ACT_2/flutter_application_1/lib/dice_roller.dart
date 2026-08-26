import 'dart:math';
import 'package:flutter/material.dart';
 
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
 
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}
 
class _DiceRollerState extends State<DiceRoller> {
  final randomizer = Random();
  var currentDiceImage = 'assets/dice-images/dice-2.png';
  void rollDice() {
    setState((){
      var num = randomizer.nextInt(6) +1;
     currentDiceImage = 'assets/dice-images/dice-4.png';
    });
  }
 @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(width: 200, currentDiceImage),
        SizedBox(height: 30),
        TextButton(
          onPressed: rollDice,
          child: Text(style: TextStyle(fontSize: 28), "Roll Dice"),
        ),
      ],
    );
  }
}
 
 
