import 'package:circadia/controllers/firebase_controller.dart';
import 'package:circadia/controllers/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final HomeController controller = Get.put(HomeController());

  final FirebaseController controllerr = FirebaseController();
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          height: 60,
          width: 110,
          child: Image.asset("assets/ThingsTOD.png"),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 16, bottom: 16),
          child: GestureDetector(
              onTap: () {
                scaffoldkey.currentState.openDrawer();
              },
              child: Image.asset(
                "assets/menubar.png",
              )),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 15, top: 16, bottom: 16),
            child: Image.asset("assets/addd.png"),
          ),
        ],
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 15, bottom: 10),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[300],
                    ),
                    hintText: 'Search Task',
                    suffixIcon: Icon(Icons.search, color: Color(0xff6035D0)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10, top: 5),
                  ),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(60.0)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              color: Color(0xff6035D0),
              child: DrawerHeader(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage("assets/person.png"),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${auth.currentUser.email}",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 15),
                    leading: Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.black,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'New Task',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      controllerr.signout();
                    },
                    contentPadding: const EdgeInsets.only(left: 25),
                    leading: Icon(
                      Icons.logout,
                      size: 28,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: controller.obx(
        (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              var item = data[index]['title'];
              return Dismissible(
                key: Key(item),
                onDismissed: (DismissDirection dir) {
                  data.removeAt(index);
                },
                background: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/clipboards.png"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Open",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      )
                    ],
                  ),
                  color: Colors.green,
                  alignment: Alignment.centerLeft,
                ),
                secondaryBackground: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Remove",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                ),
                child: ListTile(
                  title: Text("${data[index]['title']}"),
                ),
              );
            }),
        onError: (error) => Center(
          child: Text(error),
        ),
      ),
    );
  }
}
