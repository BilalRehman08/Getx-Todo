import 'package:circadia/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';

enum Priority { red, orange, blue, green }

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  Priority _character = Priority.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          "New Task",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
              child: Text("${_character}"),
            ),
            Container(
              color: Colors.white,
              height: 50,
              child: Row(
                children: [
                  Radio<Priority>(
                    fillColor:
                        MaterialStateColor.resolveWith((states) => Colors.red),
                    activeColor: Colors.red,
                    focusColor: Colors.red,
                    value: Priority.red,
                    groupValue: _character,
                    onChanged: (Priority value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  Radio<Priority>(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.orange),
                    activeColor: Colors.orange,
                    focusColor: Colors.orange,
                    value: Priority.orange,
                    groupValue: _character,
                    onChanged: (Priority value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  Radio<Priority>(
                    fillColor:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
                    activeColor: Colors.blue,
                    focusColor: Colors.blue,
                    value: Priority.blue,
                    groupValue: _character,
                    onChanged: (Priority value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  Radio<Priority>(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    activeColor: Colors.green,
                    focusColor: Colors.green,
                    value: Priority.green,
                    groupValue: _character,
                    onChanged: (Priority value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ],
              ),
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
      ),
    );
  }
}
