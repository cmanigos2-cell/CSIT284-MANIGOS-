import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget{

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text('Pick your category'),),
    body: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio:3/2,),
    children: [
      Text('1'),
      Text('2'),
      Text('3'),
      Text('4'),
      Text('5'),
      Text('6'),

    ],
    ),
    );
  }
}