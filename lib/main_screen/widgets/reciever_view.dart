import 'package:bloc_example/models/chat.dart';
import 'package:flutter/material.dart';

class RecieverView extends StatelessWidget {
  final ChatConv message;
  const RecieverView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              message.date,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
