import 'package:flutter/material.dart';

class MySheet extends StatelessWidget {
  MySheet({super.key, required this.addedItem, this.initText});
  Function(String) addedItem;
  String? initText;

  @override
  Widget build(BuildContext context) {
    TextEditingController myController = TextEditingController(
      text: initText ?? "",
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          TextField(controller: myController),
          ElevatedButton(
            onPressed: () {
              String newText = myController.text;
              if (newText.isNotEmpty) {
                addedItem(newText);
              }
              Navigator.of(context).pop();
            },
             child: Text(initText == null ? "Add" : "Update"),
          ),
        ],
      ),
    );
  }
}
