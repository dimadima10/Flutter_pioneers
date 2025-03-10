import 'package:flutter/material.dart';
import 'package:my_notepad/main.dart';
import 'package:my_notepad/my_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  List<String> myList = [];

  _fetch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    myList = prefs.getStringList('myList') ?? [];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Title(
              color: Colors.black,
              child: Text(
                'My Notepad',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (ctxt) {
                    return MySheet(
                      addedItem: (p0) async {
                        myList.add(p0);
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setStringList("myList", myList);
                        setState(() {});
                      },
                    );
                  },
                );
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: myList.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.pink,
                child: Row(
                  children: [
                    Text(myList[index]),
                    Spacer(),
                    IconButton(
                      onPressed: () async {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return MySheet(
                              addedItem: (newText) async {
                                if (newText.isEmpty) {
                                  return;
                                }
                                myList[index] = newText;
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setStringList('myList', myList);
                                setState(() {});
                              },
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () async {
                        myList.removeAt(index);
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.remove('myList');
                        setState(() {});
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
