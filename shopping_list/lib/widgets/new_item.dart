import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();

  var _enteredName = '';
  var _enterdQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables];

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.of(context).pop(
        GroceryItem(
          id: DateTime.now().toString(),
          name:_enteredName,
          quantity:_enterdQuantity,
          category:_selectedCategory!
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Item'),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(label: const Text('Name')),
                  onSaved: (value) {
                    _enteredName = value!;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1) {
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
                        initialValue: _enterdQuantity.toString(),
                        onSaved: (value) {
                          _enterdQuantity = int.parse(value!);
                        },
                        validator: (value) {
                          if (value == null ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <= 0) {
                            return 'Input must be a number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                        initialValue: _selectedCategory,
                          items: [
                            for (final Category in categories.entries)
                              DropdownMenuItem(
                                  value: Category.value,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 16,
                                        height: 16,
                                        color: Category.value.color,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(Category.value.title)
                                    ],
                                  ))
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value!;
                            });
                          }),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {
                      _formKey.currentState!.reset();
                    }, child: const Text('Reset')),
                    ElevatedButton(
                        onPressed: _saveItem, child: const Text('Add Item')),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
