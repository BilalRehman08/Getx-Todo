import 'package:circadia/controllers/firebase_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetWidget<FirebaseController> {
  final FirebaseController controller = FirebaseController();
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
                      backgroundImage: AssetImage("assets/Logo.png"),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Ishaq Hassan",
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
                      controller.signout();
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
      body: Center(child: Text("data")),
    );
  }
}
