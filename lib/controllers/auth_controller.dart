import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mappingmatching/pages/auth/signup.dart';
import 'package:mappingmatching/pages/matching.dart';
class AuthController extends GetxController{
  static AuthController instance = Get.find();
  //email, password, name, ...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    auth.signOut();
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user==null){
      Get.offAll(()=>sign_up_page());
    }else{
      Get.offAll(()=>MatchingPage());
    }
  }

  void login(String email, password){
    try{
      auth.signInWithEmailAndPassword(email: email, password: password).then(
        (userCredential) =>{
          _user = Rx<User?>(userCredential.user)
        }
      );
    }catch(e){
      Get.snackbar("About User", "User message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
          "Account creation failed",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        messageText: Text(
          e.toString(),
            style: TextStyle(
                color: Colors.white
            )
        )
      );
    }
  }

  void register(String email, password){
    try{
      var result = auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About User", "User message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
          "Account creation failed",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        messageText: Text(
          e.toString(),
            style: TextStyle(
                color: Colors.white
            )
        )
      );
    }
  }
}