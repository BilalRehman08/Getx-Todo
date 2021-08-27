import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: GestureDetector(onTap: () {}, child: Icon(Icons.arrow_back)),
        title: Text(
          "New Task",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[400],
                      ),
                      hintText: "Task Name",
                      contentPadding: const EdgeInsets.all(15)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 13, color: Colors.grey[400]),
                      hintText: "Description",
                      contentPadding: const EdgeInsets.all(15)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 13, color: Colors.grey[400]),
                      hintText: "Category",
                      contentPadding: const EdgeInsets.all(15)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 13, color: Colors.grey[400]),
                      hintText: "Pick Date & Time",
                      contentPadding: const EdgeInsets.all(15)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Priority"),
          ),
          Container(
            color: Colors.white,
            height: 50,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff6035D0),
                ),
                child: Text("ADD",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ))
        ],
      ),
    );
  }
}
