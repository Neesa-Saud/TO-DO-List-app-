import 'package:flutter/material.dart';
import 'package:myapp/pages/todolist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 240, 229, 188),
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ), // Horizontal padding
          child: ListView(
            children: [
              SizedBox(height: 35),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TOdoList()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 9, 74, 105),
                  padding: EdgeInsets.all(20),
                  textStyle: TextStyle(fontSize: 18),
                  minimumSize: Size(0, 55), // Control height
                ).copyWith(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                icon: Icon(
                  Icons.list,
                  color: Colors.white, // Set icon color
                  size: 30, // Set icon size
                ),
                label: Text(
                  'To do List',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 35),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 9, 74, 105),
                  padding: EdgeInsets.all(20),
                  textStyle: TextStyle(fontSize: 18),
                  minimumSize: Size(0, 50),
                ).copyWith(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                icon: Icon(Icons.alarm, color: Colors.white, size: 30),
                label: Text(
                  'Remainder',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 35),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 9, 74, 105),
                  padding: EdgeInsets.all(20),
                  textStyle: TextStyle(fontSize: 18),
                  minimumSize: Size(0, 50),
                ).copyWith(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                icon: Icon(Icons.note, color: Colors.white, size: 30),
                label: Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 35),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 9, 74, 105),
                  padding: EdgeInsets.all(20),
                  textStyle: TextStyle(fontSize: 18),
                  minimumSize: Size(0, 50),
                ).copyWith(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                icon: Icon(Icons.star, color: Colors.white, size: 30),
                label: Text(
                  'Rate us',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 35),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 9, 74, 105),
          title: Padding(
            padding: EdgeInsets.only(top: 28),
            child: Text(
              'To do List',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 9, 74, 105),
        child: Center(
          child: ElevatedButton(
            onPressed: () => showTaskBottomSheet(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 240, 229, 188),
              padding: EdgeInsets.all(20),
              textStyle: TextStyle(fontSize: 18),
            ),
            child: Text(
              "Add Task",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
