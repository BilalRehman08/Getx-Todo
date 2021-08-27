import 'package:circadia/screens/home_screen.dart';
import 'package:circadia/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  Rxn<User> _firebaseUser = Rxn<User>();

  String get user => _firebaseUser.value?.email;
  String get imageurl => _firebaseUser.value?.photoURL;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());

    print(" Auth Change :   ${_auth.currentUser}");
  }

  // function to createuser, login and sign out user

  void createUser(
      String firstname, String lastname, String email, String password) async {
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User user = result.user;

    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      "First Name": firstname,
      "Last Name": lastname,
      "Email": email
    }).then((value) {
      Get.offAll(Login());
    }).catchError(
      (onError) =>
          Get.snackbar("Error while creating account ", onError.message),
    );

    // await _auth
    //     .createUserWithEmailAndPassword(email: email, password: password)
    //     .then((value) {
    //   reference.add(userdata).then((value) => Get.offAll(Login()));
    // }).catchError(
    //   (onError) =>
    //       Get.snackbar("Error while creating account ", onError.message),
    // );
  }

  void login(String email, String password) async {
    var _userName;
    FirebaseFirestore.instance
        .collection('Users')
        .doc((await FirebaseAuth.instance.currentUser).uid)
        .get()
        .then((value) {
      _userName = value.data()['First Name'].toString();
    });
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.offAll(Home()))
        .catchError(
            (onError) => Get.snackbar("Error while sign in ", onError.message));
  }

  void signout() async {
    await _auth.signOut().then((value) => Get.offAll(Login()));
  }

  void google_signIn() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final User user = (await _auth
        .signInWithCredential(credential)
        .then((value) => Get.offAll(Home())));
  }

  void google_signOut() async {
    await googleSignIn.signOut().then((value) => Get.offAll(Login()));
  }
}
