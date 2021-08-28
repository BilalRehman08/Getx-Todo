import 'package:circadia/models/task_model.dart';
import 'package:circadia/provider/data_provider.dart';
import 'package:flutter/material.dart';

enum Priority { red, orange, blue, green }

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  Priority _character = Priority.red;
  final TextEditingController taskname = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController datatime = TextEditingController();

  Future<User> _futureUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(
            "New Task",
            style: TextStyle(fontSize: 17),
          ),
        ),
        body: SingleChildScrollView(
          child: (_futureUser == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              TextField(
                controller: taskname,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[400],
                    ),
                    hintText: "Task Name",
                    contentPadding: const EdgeInsets.all(15)),
              ),
              TextField(
                controller: description,
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey[400]),
                    hintText: "Description",
                    contentPadding: const EdgeInsets.all(15)),
              ),
              TextField(
                controller: category,
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey[400]),
                    hintText: "Category",
                    contentPadding: const EdgeInsets.all(15)),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: datatime,
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey[400]),
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
                fillColor:
                    MaterialStateColor.resolveWith((states) => Colors.orange),
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
                fillColor:
                    MaterialStateColor.resolveWith((states) => Colors.green),
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
              onPressed: () {
                setState(() {
                  _futureUser = createUser(
                    "1",
                    "${taskname.text}",
                    "${description.text}",
                    "${category.text}",
                    42352352353,
                    3,
                    "user id 200",
                    true,
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff6035D0),
              ),
              child: Text("ADD",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ))
      ],
    );
  }

  FutureBuilder<User> buildFutureBuilder() {
    return FutureBuilder<User>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(child: Text("Successfully Post"));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
