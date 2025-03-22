import 'package:flutter/material.dart';

class TOdoList extends StatefulWidget {
  const TOdoList({super.key});

  @override
  State<TOdoList> createState() => _TOdoListState();
}

class _TOdoListState extends State<TOdoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Increased height of AppBar
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 9, 74, 105),
          leading: Icon(Icons.arrow_back_ios, color: Colors.white),
          actions: [Icon(Icons.add, color: Colors.white), SizedBox(width: 15)],
          title: Padding(
            padding: EdgeInsets.only(top: 18), // Adds space above the title
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevents overflow
              children: [
                Icon(Icons.note_alt_sharp, color: Colors.white),
                Text('To Do List'),
              ],
            ),
          ),
          centerTitle: true, // Centers the title properly
        ),
      ),
    );
  }
}
