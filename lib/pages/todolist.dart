import 'package:flutter/material.dart';
import 'package:myapp/functions/database.dart';
import 'package:random_string/random_string.dart';

class TOdoList extends StatefulWidget {
  const TOdoList({super.key});

  @override
  State<TOdoList> createState() => _TOdoListState();
}

class _TOdoListState extends State<TOdoList> {
  TextEditingController taskcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Increased height of AppBar
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 9, 74, 105),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Add New Task'),
                      content: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter task here',
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text('Add'),
                          onPressed: () async {
                            String id = randomAlphaNumeric(10);
                            Map<String, dynamic> writeTask = {
                              'task': taskcontroller.text,
                              'id': id,
                            };
                            await DatabaseMethods()
                                .addTask(writeTask, id)
                                .then((value) => Navigator.of(context).pop());
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            SizedBox(width: 15),
          ],
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
      body: Column(),
    );
  }
}
