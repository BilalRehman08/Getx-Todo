import 'package:circadia/screens/home_screen.dart';
import 'package:circadia/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> _firebaseUser = Rxn<User>();

  String get user => _firebaseUser.value?.email;
  String get imageurl => _firebaseUser.value?.photoURL;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  // function to createuser, login and sign out user

  void createUser(
      String firstname, String lastname, String email, String password) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("Users");

    Map<String, String> userdata = {
      "First Name": firstname,
      "Last Name": lastname,
      "Email": email
    };

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      reference.add(userdata).then((value) => Get.offAll(Login()));
    }).catchError(
      (onError) =>
          Get.snackbar("Error while creating account ", onError.message),
    );
  }

  void login(String email, String password) async {
    // var _userName;
    // FirebaseFirestore.instance
    //     .collection('Users')
    //     .doc(FirebaseAuth.instance.currentUser.uid)
    //     .get()
    //     .then((value) {
    //   _userName = value.data()['First Name'].toString();
    // });
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.offAll(Home()))
        .catchError(
            (onError) => Get.snackbar("Error while sign in ", onError.message));
  }

  void signout() async {
    await _auth.signOut().then((value) => Get.offAll(Login()));
  }
}
