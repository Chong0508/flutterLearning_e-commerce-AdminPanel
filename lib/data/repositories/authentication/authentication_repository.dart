import 'package:e_commerce_admin_panel/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // Firebase Auth Instance
  final _auth = FirebaseAuth.instance;

  // Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  // Get IsAuthenticated User
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
  }

  // LOGIN
  

  // REGISTER

  // REGISTER USER BY ADMIN

  // EMAIL VERIFICATION

  // FORGET PASSWORD

  // RE AUTHENTICATE USER

  // LOGOUT USER

  // DELETE USER

}