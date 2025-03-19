import 'package:bloc_example/screens/main/main_bloc.dart';
import 'package:bloc_example/screens/main/widgets/profile_card_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = MainBloc();
    bloc.fillChatList();
    return Scaffold(
      appBar: AppBar(title: Text("Chats")),
      body: ListView.builder(
        itemCount: bloc.chatList.length,
        itemBuilder: (ctx, index) {
          return ProfileCardView(details: bloc.chatList[index]);
        },
      ),
    );
  }
}
