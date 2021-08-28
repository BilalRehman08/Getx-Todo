import 'package:circadia/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Data extends GetView<Home> {
  final title;
  final description;
  final category;
  Data(this.title, this.description, this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Center(child: Text("Data")),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 2,
            child: ListTile(
              title: Text("Task Name"),
              subtitle: Text(this.title),
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              title: Text("Description"),
              subtitle: Text(this.description),
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              title: Text("Category"),
              subtitle: Text(this.category),
            ),
          )
        ],
      ),
    );
  }
}
