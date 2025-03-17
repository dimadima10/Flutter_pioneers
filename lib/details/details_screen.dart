import 'package:bloc_example/main_screen/widgets/reciever_view.dart';
import 'package:bloc_example/main_screen/widgets/sender_view.dart';
import 'package:bloc_example/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatefulWidget {
  final Chat details;

  DetailsScreen({super.key, required this.details});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController myController = TextEditingController();

  String getCurrentDateTime() {
    return DateFormat('hh:mm aa').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(widget.details.image),
              backgroundColor: Colors.transparent,
            ),
            Text(widget.details.name),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.details.chatConv.length,
              itemBuilder: (context, index) {
                final msg = widget.details.chatConv[index];

                return msg.isSender
                    ? SenderView(message: msg)
                    : RecieverView(message: msg);
              },
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 221, 220, 221),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(hintText: "Enter message..."),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.details.chatConv.add(
                          ChatConv(
                            date: getCurrentDateTime(),
                            text: myController.text,
                            isSender: false,
                          ),
                        );
                      });
                    },
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
