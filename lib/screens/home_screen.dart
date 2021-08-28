import 'package:circadia/controllers/firebase_controller.dart';
import 'package:circadia/controllers/home_controller.dart';
import 'package:circadia/screens/addtask.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data.dart';

class Home extends GetView<HomeController> {
  final contt = Get.lazyPut<HomeController>(() => HomeController());
  final FirebaseAuth auth = FirebaseAuth.instance;

  HomeController controller = Get.put(HomeController());

  final FirebaseController controllerr = FirebaseController();
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
          GestureDetector(
            onTap: () {
              Get.offAll(AddTask());
            },
            child: Container(
              padding: const EdgeInsets.only(right: 15, top: 16, bottom: 16),
              child: Image.asset("assets/addd.png"),
            ),
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
                    onTap: () {
                      Get.offAll(AddTask());
                    },
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
              var time = data[index]['timestamp'];
              var timee = DateTime.fromMicrosecondsSinceEpoch(time);
              String formattedTime = DateFormat.Hm().format(timee);
              String format = DateFormat.H().format(timee);
              var timeeee = double.parse(format);
              print(formattedTime);
              var item = data[index]['title'];
              return Dismissible(
                  key: Key(item),
                  onDismissed: (DismissDirection dir) {
                    if (dir == DismissDirection.startToEnd) {
                      Get.offAll(Data(
                        data[index]['title'],
                        data[index]['description'],
                        data[index]['category'],
                      ));
                    } else {
                      data.removeAt(index);
                    }
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
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: ClipPath(
                            clipper: MyCustomClipper(),
                            child: Container(
                                width: 80.0,
                                height: 20.0,
                                color: Colors.green,
                                alignment: Alignment.topCenter,
                                padding: EdgeInsets.only(left: 7, top: 2),
                                child: Text(
                                  "Yesterday",
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                )),
                          ),
                        ),
                        Align(
                          heightFactor: 0.8,
                          child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$formattedTime"),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: timeeee > 12
                                      ? Text(
                                          "P.M",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          "A.M",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                )
                              ],
                            ),
                            title: Text("${data[index]['title']}"),
                            subtitle: Text("${data[index]['description']}"),
                            trailing: Container(
                              width: 60,
                              // padding: const EdgeInsets.only(top: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.star),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    backgroundColor:
                                        "${data[index]['priority']}" == "9"
                                            ? Colors.red
                                            : Colors.green,
                                    radius: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
        onError: (error) => Center(
          child: Text(error),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width / 5.5, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
