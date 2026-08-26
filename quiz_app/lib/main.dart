import 'package:flutter/material.dart';
 
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
 
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 101, 44, 207),
                Color.fromARGB(255, 53, 28, 161),
              ],
            ),
          ),
 
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
 
              child: const Text(
                'Learn Flutter the fun way!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}