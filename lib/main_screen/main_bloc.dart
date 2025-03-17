import 'package:bloc_example/models/chat.dart';
import 'package:intl/intl.dart';

class MainBloc {
  List<Chat> chatList = [];
  String getCurrentDateTime() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('hh:mm aa');
    final String formatted = formatter.format(now);
    return formatted;
  }

  void fillChatList() {
    chatList = [
      Chat(
        name: 'suad',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzPRQ6LprnPzvvP-_vVO_nhSokwda8CMsnwQ&s',
        date: getCurrentDateTime(),
        chatConv: [
          ChatConv(date: getCurrentDateTime(), isSender: true, text: "hello"),
        ],
      ),
      Chat(
        name: 'abed',
        image:
            'https://t4.ftcdn.net/jpg/06/08/55/73/360_F_608557356_ELcD2pwQO9pduTRL30umabzgJoQn5fnd.jpg',
        date: getCurrentDateTime(),
        chatConv: [
          ChatConv(date: getCurrentDateTime(), isSender: true, text: "hey"),
        ],
      ),
      Chat(
        name: 'layla',
        image:
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZSUyMGltYWdlfGVufDB8fDB8fHww',
        date: getCurrentDateTime(),
        chatConv: [
          ChatConv(date: getCurrentDateTime(), isSender: true, text: "hola"),
        ],
      ),
      Chat(
        name: 'sawsan',
        image:
            'https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=612x612&w=0&k=20&c=tyLvtzutRh22j9GqSGI33Z4HpIwv9vL_MZw_xOE19NQ=',
        date: getCurrentDateTime(),
        chatConv: [
          ChatConv(date: getCurrentDateTime(), isSender: true, text: "hii"),
        ],
      ),
    ];
  }
}
