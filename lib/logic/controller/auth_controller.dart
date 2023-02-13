import 'package:e_commerce/view/screens/welcocme_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  // Variables
  bool isVisibility = false;
  bool isCheckBox = false;
  var displayUserName = ''.obs;
  var displayUserEmail = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? get userProfile => auth.currentUser;

  // bool Methods
  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void isChecked() {
    isCheckBox = !isCheckBox;
    update();
  }


  @override
  void onInit() {
    displayUserName.value = (userProfile != null ? userProfile!.displayName : "")!;
    displayUserEmail.value = (userProfile != null ? userProfile!.email : "")!;
    super.onInit();
  }


  // Firebase Methods
  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed('/main');
    } on FirebaseAuthException catch (error) {
      String title = error.code;
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value) {
        displayUserName.value = auth.currentUser!.displayName!;
      });
      update();
      Get.offNamed('/main');
    } on FirebaseAuthException catch (error) {
      String title = error.code;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // void googleSignUpApp() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     displayUserName.value = googleUser!.displayName!;
  //     displayUserPic = googleUser.photoUrl!;
  //     update();
  //     Get.offNamed('/main');
  //   } catch (error){
  //     Get.snackbar(
  //       'Error!',
  //       error.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }

  void resetPassword(
    String email,
) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await GoogleSignIn().signOut();
      displayUserName.value = '';
      displayUserEmail.value = '';
      Get.offNamed('/welcome');
    } catch (error) {
    Get.snackbar(
    'Error!',
    error.toString(),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    );
    }
  }
}
