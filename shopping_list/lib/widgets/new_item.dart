import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';


class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Item'),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(label: const Text('Name')),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name must not be empty';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(label: const Text('Quantity')),
                        initialValue: '1',
                        validator: (value) {
                          if (value == null || int.tryParse(value) == null) {
                            return 'Input must be a number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: DropdownButtonFormField(
                        items: [
                          for(final Category in categories.entries)
                          DropdownMenuItem(
                            value: Category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16, height: 16,
                                  color: Category.value.color,
                                ),
                                const SizedBox(width: 6,),
                                Text(Category.value.title)
                              ],
                            )
                            )
                        ],
                        onChanged: (value) {

                        }
                      ), 
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
